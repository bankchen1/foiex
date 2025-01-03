<template>
  <div class="assets-page">
    <div class="page-header">
      <h2>资产管理</h2>
      <div class="header-actions">
        <el-button type="primary" @click="showDepositDialog = true">充值</el-button>
        <el-button type="warning" @click="showWithdrawDialog = true">提现</el-button>
      </div>
    </div>

    <!-- 资产总览 -->
    <div class="overview-cards">
      <el-card class="overview-card">
        <template #header>
          <div class="card-header">
            <span>总资产折合（USDT）</span>
            <el-button link @click="refreshAssets">
              <el-icon><Refresh /></el-icon>
            </el-button>
          </div>
        </template>
        <div class="total-balance">
          {{ formatAmount(totalBalance) }}
        </div>
      </el-card>
    </div>

    <!-- 资产列表 -->
    <div class="assets-list">
      <el-table :data="assetsList" v-loading="loading">
        <el-table-column prop="currency" label="币种">
          <template #default="{ row }">
            <div class="currency-cell">
              <img :src="getCurrencyIcon(row.currency)" :alt="row.currency" class="currency-icon">
              <span>{{ row.currency }}</span>
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="total" label="总额">
          <template #default="{ row }">
            {{ formatAmount(row.total) }}
          </template>
        </el-table-column>
        <el-table-column prop="available" label="可用">
          <template #default="{ row }">
            {{ formatAmount(row.available) }}
          </template>
        </el-table-column>
        <el-table-column prop="locked" label="冻结">
          <template #default="{ row }">
            {{ formatAmount(row.locked) }}
          </template>
        </el-table-column>
        <el-table-column prop="value" label="折合USDT">
          <template #default="{ row }">
            {{ formatAmount(row.value) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200">
          <template #default="{ row }">
            <el-button link @click="handleDeposit(row)">充值</el-button>
            <el-button link @click="handleWithdraw(row)">提现</el-button>
            <el-button link @click="handleTrade(row)">交易</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <!-- 充值对话框 -->
    <el-dialog v-model="showDepositDialog" title="充值" width="500px">
      <div v-if="selectedCurrency" class="deposit-content">
        <div class="qr-section">
          <div class="network-select">
            <span>选择网络：</span>
            <el-select v-model="selectedNetwork">
              <el-option
                v-for="network in availableNetworks"
                :key="network.value"
                :label="network.label"
                :value="network.value"
              />
            </el-select>
          </div>
          <div class="address-section">
            <p>存币地址</p>
            <div class="address-box">
              <span>{{ depositAddress }}</span>
              <el-button link @click="copyAddress">
                <el-icon><CopyDocument /></el-icon>
              </el-button>
            </div>
            <div class="qr-code">
              <!-- 这里放二维码组件 -->
            </div>
          </div>
        </div>
        <div class="deposit-notice">
          <h4>充值说明</h4>
          <ul>
            <li>请确认您选择的网络正确，否则可能导致资产丢失</li>
            <li>最小充值金额：0.001 {{ selectedCurrency }}</li>
            <li>充值到账时间：1-2个网络确认后到账</li>
          </ul>
        </div>
      </div>
    </el-dialog>

    <!-- 提现对话框 -->
    <el-dialog v-model="showWithdrawDialog" title="提现" width="500px">
      <el-form
        v-if="selectedCurrency"
        ref="withdrawFormRef"
        :model="withdrawForm"
        :rules="withdrawRules"
        label-width="100px"
      >
        <el-form-item label="币种">
          <el-input :value="selectedCurrency" disabled />
        </el-form-item>
        <el-form-item label="网络" prop="network">
          <el-select v-model="withdrawForm.network" placeholder="请选择网络">
            <el-option
              v-for="network in availableNetworks"
              :key="network.value"
              :label="network.label"
              :value="network.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="提现地址" prop="address">
          <el-input v-model="withdrawForm.address" placeholder="请输入提现地址" />
        </el-form-item>
        <el-form-item label="提现数量" prop="amount">
          <el-input v-model="withdrawForm.amount" type="number">
            <template #append>{{ selectedCurrency }}</template>
          </el-input>
          <div class="amount-info">
            <span>可用：{{ formatAmount(availableAmount) }}</span>
            <el-button link @click="setMaxAmount">全部</el-button>
          </div>
        </el-form-item>
        <el-form-item label="手续费">
          <el-input :value="withdrawFee" disabled>
            <template #append>{{ selectedCurrency }}</template>
          </el-input>
        </el-form-item>
        <el-form-item label="实际到账">
          <el-input :value="actualAmount" disabled>
            <template #append>{{ selectedCurrency }}</template>
          </el-input>
        </el-form-item>
        <el-form-item v-if="userStore.user?.is2FAEnabled" label="2FA验证码" prop="code2fa">
          <el-input v-model="withdrawForm.code2fa" placeholder="请输入6位验证码" maxlength="6" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showWithdrawDialog = false">取消</el-button>
          <el-button type="primary" @click="submitWithdraw" :loading="submitting">
            确认提现
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import { useRouter } from 'vue-router';
import { useToast } from 'vue-toastification';
import { Refresh, CopyDocument } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import { useUserStore } from '../../stores/user';

const router = useRouter();
const toast = useToast();
const userStore = useUserStore();

const loading = ref(false);
const showDepositDialog = ref(false);
const showWithdrawDialog = ref(false);
const selectedCurrency = ref('');
const selectedNetwork = ref('');
const submitting = ref(false);

// 模拟数据
const totalBalance = ref('123456.78');
const depositAddress = ref('0x1234567890abcdef1234567890abcdef12345678');
const withdrawFee = ref('0.001');
const availableAmount = ref('10.000');

const assetsList = ref([
  {
    currency: 'BTC',
    total: '1.23456789',
    available: '1.23456789',
    locked: '0',
    value: '45678.90'
  },
  {
    currency: 'ETH',
    total: '10.23456789',
    available: '10.23456789',
    locked: '0',
    value: '23456.78'
  },
  {
    currency: 'USDT',
    total: '54321.12',
    available: '54321.12',
    locked: '0',
    value: '54321.12'
  }
]);

const availableNetworks = [
  { label: 'BTC', value: 'BTC' },
  { label: 'ETH (ERC20)', value: 'ERC20' },
  { label: 'BSC (BEP20)', value: 'BEP20' },
  { label: 'TRX (TRC20)', value: 'TRC20' }
];

const withdrawForm = ref({
  network: '',
  address: '',
  amount: '',
  code2fa: ''
});

const withdrawRules: FormRules = {
  network: [{ required: true, message: '请选择网络', trigger: 'change' }],
  address: [{ required: true, message: '请输入提现地址', trigger: 'blur' }],
  amount: [
    { required: true, message: '请输入提现数量', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (Number(value) <= 0) {
          callback(new Error('提现数量必须大于0'));
        } else if (Number(value) > Number(availableAmount.value)) {
          callback(new Error('提现数量不能大于可用余额'));
        } else {
          callback();
        }
      },
      trigger: 'blur'
    }
  ],
  code2fa: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { len: 6, message: '验证码必须是6位', trigger: 'blur' }
  ]
};

const actualAmount = computed(() => {
  if (!withdrawForm.value.amount) return '0';
  return (Number(withdrawForm.value.amount) - Number(withdrawFee.value)).toFixed(8);
});

// 格式化金额
const formatAmount = (amount: string) => {
  return Number(amount).toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 8
  });
};

// 获取货币图标
const getCurrencyIcon = (currency: string) => {
  return `https://cdn.example.com/crypto-icons/${currency.toLowerCase()}.png`;
};

// 刷新资产
const refreshAssets = async () => {
  loading.value = true;
  try {
    // TODO: 调用API获取最新资产数据
    await new Promise(resolve => setTimeout(resolve, 1000));
  } catch (error) {
    console.error('Failed to refresh assets:', error);
  } finally {
    loading.value = false;
  }
};

// 复制地址
const copyAddress = async () => {
  try {
    await navigator.clipboard.writeText(depositAddress.value);
    toast.success('地址已复制');
  } catch (error) {
    toast.error('复制失败，请手动复制');
  }
};

// 设置最大提现金额
const setMaxAmount = () => {
  withdrawForm.value.amount = availableAmount.value;
};

// 处理充值
const handleDeposit = (row: any) => {
  selectedCurrency.value = row.currency;
  showDepositDialog.value = true;
};

// 处理提现
const handleWithdraw = (row: any) => {
  selectedCurrency.value = row.currency;
  availableAmount.value = row.available;
  showWithdrawDialog.value = true;
};

// 跳转到交易页面
const handleTrade = (row: any) => {
  router.push(`/trade?symbol=${row.currency}/USDT`);
};

// 提交提现
const submitWithdraw = async () => {
  const formEl = document.querySelector('form') as FormInstance | null;
  if (!formEl) return;

  try {
    await formEl.validate();
    submitting.value = true;

    // TODO: 调用API提交提现请求
    await new Promise(resolve => setTimeout(resolve, 1000));

    toast.success('提现申请已提交');
    showWithdrawDialog.value = false;
  } catch (error: any) {
    toast.error(error.message || '提现失败，请重试');
  } finally {
    submitting.value = false;
  }
};
</script>

<style scoped>
.assets-page {
  padding: 20px;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.header-actions {
  display: flex;
  gap: 10px;
}

.overview-cards {
  margin-bottom: 30px;
}

.overview-card {
  max-width: 300px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.total-balance {
  font-size: 24px;
  font-weight: bold;
  color: var(--el-color-primary);
}

.currency-cell {
  display: flex;
  align-items: center;
  gap: 8px;
}

.currency-icon {
  width: 24px;
  height: 24px;
  border-radius: 50%;
}

.deposit-content {
  padding: 20px;
}

.network-select {
  margin-bottom: 20px;
}

.address-section {
  margin-bottom: 20px;
}

.address-box {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 10px;
  background: var(--el-bg-color-page);
  border-radius: 4px;
  margin: 10px 0;
}

.qr-code {
  text-align: center;
  margin: 20px 0;
}

.deposit-notice {
  background: var(--el-bg-color-page);
  padding: 15px;
  border-radius: 4px;
}

.deposit-notice h4 {
  margin-bottom: 10px;
}

.deposit-notice ul {
  padding-left: 20px;
  margin: 0;
}

.amount-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 5px;
  color: var(--el-text-color-secondary);
  font-size: 14px;
}
</style>
