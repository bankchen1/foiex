<template>
  <div class="assets-page">
    <!-- Overview Section -->
    <section class="overview-section">
      <div class="section-content">
        <h1>Assets Overview</h1>
        
        <!-- Total Assets Card -->
        <el-card class="total-assets">
          <template #header>
            <div class="card-header">
              <span>Total Assets (USDT)</span>
              <el-button link @click="refreshAssets">
                <el-icon><Refresh /></el-icon>
              </el-button>
            </div>
          </template>
          <div class="asset-value">
            <span class="amount">${{ formatNumber(totalAssets) }}</span>
            <span class="change" :class="{ 'positive': dayChange >= 0, 'negative': dayChange < 0 }">
              {{ formatPercent(dayChange) }} (24h)
            </span>
          </div>
        </el-card>

        <!-- Asset Distribution -->
        <div class="asset-distribution">
          <el-row :gutter="20">
            <el-col :span="8">
              <el-card>
                <template #header>
                  <div class="card-header">
                    <span>Available Balance</span>
                  </div>
                </template>
                <div class="asset-value">
                  ${{ formatNumber(availableBalance) }}
                </div>
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card>
                <template #header>
                  <div class="card-header">
                    <span>In Orders</span>
                  </div>
                </template>
                <div class="asset-value">
                  ${{ formatNumber(inOrders) }}
                </div>
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card>
                <template #header>
                  <div class="card-header">
                    <span>Unrealized P&L</span>
                  </div>
                </template>
                <div class="asset-value">
                  <span :class="{ 'positive': unrealizedPnL >= 0, 'negative': unrealizedPnL < 0 }">
                    ${{ formatNumber(unrealizedPnL) }}
                  </span>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </div>
      </div>
    </section>

    <!-- Assets List Section -->
    <section class="assets-list-section">
      <div class="section-content">
        <div class="section-header">
          <h2>Your Assets</h2>
          <div class="actions">
            <el-input
              v-model="search"
              placeholder="Search assets"
              :prefix-icon="Search"
              clearable
              class="search-input"
            />
            <el-radio-group v-model="assetFilter" size="large">
              <el-radio-button label="all">All</el-radio-button>
              <el-radio-button label="spot">Spot</el-radio-button>
              <el-radio-button label="margin">Margin</el-radio-button>
            </el-radio-group>
          </div>
        </div>

        <!-- Assets Table -->
        <el-table
          :data="filteredAssets"
          style="width: 100%"
          :loading="loading"
        >
          <el-table-column label="Asset" min-width="200">
            <template #default="{ row }">
              <div class="asset-cell">
                <img :src="row.icon" :alt="row.symbol" class="asset-icon" />
                <div class="asset-info">
                  <span class="asset-symbol">{{ row.symbol }}</span>
                  <span class="asset-name">{{ row.name }}</span>
                </div>
              </div>
            </template>
          </el-table-column>

          <el-table-column prop="total" label="Total" min-width="150">
            <template #default="{ row }">
              {{ formatNumber(row.total) }} {{ row.symbol }}
              <div class="fiat-value">≈ ${{ formatNumber(row.totalInUSDT) }}</div>
            </template>
          </el-table-column>

          <el-table-column prop="available" label="Available" min-width="150">
            <template #default="{ row }">
              {{ formatNumber(row.available) }} {{ row.symbol }}
            </template>
          </el-table-column>

          <el-table-column prop="inOrder" label="In Order" min-width="150">
            <template #default="{ row }">
              {{ formatNumber(row.inOrder) }} {{ row.symbol }}
            </template>
          </el-table-column>

          <el-table-column label="Action" width="200" fixed="right">
            <template #default="{ row }">
              <el-button-group>
                <el-button
                  type="primary"
                  @click="$router.push(`/trade?symbol=${row.symbol}_USDT`)"
                >
                  Trade
                </el-button>
                <el-button
                  type="primary"
                  plain
                  @click="handleDeposit(row)"
                >
                  Deposit
                </el-button>
                <el-button
                  type="primary"
                  plain
                  @click="handleWithdraw(row)"
                >
                  Withdraw
                </el-button>
              </el-button-group>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </section>

    <!-- Deposit Dialog -->
    <el-dialog
      v-model="depositDialogVisible"
      title="Deposit"
      width="500px"
    >
      <div v-if="selectedAsset" class="deposit-content">
        <div class="qr-code">
          <!-- Replace with actual QR code component -->
          <div class="qr-placeholder"></div>
        </div>
        <div class="deposit-address">
          <p>Deposit Address:</p>
          <el-input
            v-model="depositAddress"
            readonly
          >
            <template #append>
              <el-button @click="copyAddress">
                <el-icon><CopyDocument /></el-icon>
              </el-button>
            </template>
          </el-input>
        </div>
        <div class="deposit-notice">
          <h4>Important Notice:</h4>
          <ul>
            <li>Send only {{ selectedAsset.symbol }} to this address</li>
            <li>Minimum deposit: {{ selectedAsset.minDeposit }} {{ selectedAsset.symbol }}</li>
            <li>Deposits will be credited after {{ selectedAsset.confirmations }} network confirmations</li>
          </ul>
        </div>
      </div>
    </el-dialog>

    <!-- Withdraw Dialog -->
    <el-dialog
      v-model="withdrawDialogVisible"
      title="Withdraw"
      width="500px"
    >
      <div v-if="selectedAsset" class="withdraw-content">
        <el-form
          ref="withdrawForm"
          :model="withdrawForm"
          :rules="withdrawRules"
          label-width="100px"
        >
          <el-form-item label="Address" prop="address">
            <el-input v-model="withdrawForm.address" placeholder="Enter withdrawal address" />
          </el-form-item>
          <el-form-item label="Amount" prop="amount">
            <el-input v-model="withdrawForm.amount" type="number">
              <template #append>{{ selectedAsset.symbol }}</template>
            </el-input>
            <div class="amount-info">
              <span>Available: {{ formatNumber(selectedAsset.available) }} {{ selectedAsset.symbol }}</span>
              <el-button link type="primary" @click="setMaxAmount">Max</el-button>
            </div>
          </el-form-item>
          <el-form-item label="Network" prop="network">
            <el-select v-model="withdrawForm.network" placeholder="Select network">
              <el-option
                v-for="network in selectedAsset.networks"
                :key="network.value"
                :label="network.label"
                :value="network.value"
              />
            </el-select>
          </el-form-item>
        </el-form>
        <div class="withdraw-summary">
          <div class="summary-item">
            <span>Network Fee:</span>
            <span>{{ withdrawFee }} {{ selectedAsset.symbol }}</span>
          </div>
          <div class="summary-item">
            <span>You will receive:</span>
            <span>{{ formatNumber(withdrawAmount) }} {{ selectedAsset.symbol }}</span>
          </div>
        </div>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="withdrawDialogVisible = false">Cancel</el-button>
          <el-button type="primary" @click="handleWithdrawSubmit">
            Withdraw
          </el-button>
        </div>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { Search, Refresh, CopyDocument } from '@element-plus/icons-vue';

const router = useRouter();

// State
const loading = ref(false);
const search = ref('');
const assetFilter = ref('all');
const depositDialogVisible = ref(false);
const withdrawDialogVisible = ref(false);
const selectedAsset = ref(null);
const depositAddress = ref('0x1234...5678');

// Mock data
const totalAssets = ref(125000);
const dayChange = ref(2.5);
const availableBalance = ref(75000);
const inOrders = ref(45000);
const unrealizedPnL = ref(5000);

const assets = ref([
  {
    symbol: 'BTC',
    name: 'Bitcoin',
    icon: '/crypto-icons/btc.svg',
    total: 1.5,
    totalInUSDT: 45000,
    available: 1.2,
    inOrder: 0.3,
    minDeposit: 0.0001,
    confirmations: 2,
    networks: [
      { label: 'Bitcoin Network', value: 'BTC' },
      { label: 'BEP20', value: 'BSC' }
    ]
  },
  {
    symbol: 'ETH',
    name: 'Ethereum',
    icon: '/crypto-icons/eth.svg',
    total: 15,
    totalInUSDT: 30000,
    available: 10,
    inOrder: 5,
    minDeposit: 0.01,
    confirmations: 12,
    networks: [
      { label: 'Ethereum Network', value: 'ETH' },
      { label: 'BEP20', value: 'BSC' }
    ]
  }
]);

// Computed
const filteredAssets = computed(() => {
  let result = [...assets.value];

  if (search.value) {
    const query = search.value.toLowerCase();
    result = result.filter(
      asset =>
        asset.symbol.toLowerCase().includes(query) ||
        asset.name.toLowerCase().includes(query)
    );
  }

  if (assetFilter.value !== 'all') {
    // Add filter logic based on asset type
  }

  return result;
});

// Withdraw form
const withdrawForm = ref({
  address: '',
  amount: '',
  network: ''
});

const withdrawRules = {
  address: [
    { required: true, message: 'Please enter withdrawal address', trigger: 'blur' }
  ],
  amount: [
    { required: true, message: 'Please enter amount', trigger: 'blur' },
    {
      validator: (rule: any, value: string, callback: Function) => {
        if (selectedAsset.value && Number(value) > selectedAsset.value.available) {
          callback(new Error('Insufficient balance'));
        } else {
          callback();
        }
      },
      trigger: 'blur'
    }
  ],
  network: [
    { required: true, message: 'Please select network', trigger: 'change' }
  ]
};

const withdrawFee = ref(0.0005);
const withdrawAmount = computed(() => {
  const amount = Number(withdrawForm.value.amount);
  return amount > 0 ? amount - withdrawFee.value : 0;
});

// Methods
const formatNumber = (num: number) => {
  return num.toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 8
  });
};

const formatPercent = (percent: number) => {
  return `${percent >= 0 ? '+' : ''}${percent.toFixed(2)}%`;
};

const refreshAssets = async () => {
  loading.value = true;
  try {
    // TODO: Implement API call to refresh asset data
    await new Promise(resolve => setTimeout(resolve, 1000));
    ElMessage.success('Assets refreshed successfully');
  } catch (error) {
    ElMessage.error('Failed to refresh assets');
  } finally {
    loading.value = false;
  }
};

const handleDeposit = (asset: any) => {
  selectedAsset.value = asset;
  depositDialogVisible.value = true;
};

const handleWithdraw = (asset: any) => {
  selectedAsset.value = asset;
  withdrawDialogVisible.value = true;
  withdrawForm.value = {
    address: '',
    amount: '',
    network: ''
  };
};

const copyAddress = () => {
  navigator.clipboard.writeText(depositAddress.value)
    .then(() => {
      ElMessage.success('Address copied to clipboard');
    })
    .catch(() => {
      ElMessage.error('Failed to copy address');
    });
};

const setMaxAmount = () => {
  if (selectedAsset.value) {
    withdrawForm.value.amount = selectedAsset.value.available.toString();
  }
};

const handleWithdrawSubmit = async () => {
  try {
    // TODO: Implement withdrawal API call
    await new Promise(resolve => setTimeout(resolve, 1000));
    ElMessage.success('Withdrawal request submitted');
    withdrawDialogVisible.value = false;
  } catch (error) {
    ElMessage.error('Failed to submit withdrawal request');
  }
};

// Lifecycle
onMounted(async () => {
  loading.value = true;
  try {
    // TODO: Implement API call to fetch initial asset data
    await new Promise(resolve => setTimeout(resolve, 1000));
  } catch (error) {
    console.error('Failed to fetch assets:', error);
    ElMessage.error('Failed to load assets');
  } finally {
    loading.value = false;
  }
});
</script>

<style scoped>
.assets-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color);
}

.overview-section,
.assets-list-section {
  padding: 40px 20px;
}

.section-content {
  max-width: 1400px;
  margin: 0 auto;
}

.section-content h1 {
  font-size: 32px;
  font-weight: 600;
  margin-bottom: 32px;
}

.section-content h2 {
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 24px;
}

.total-assets {
  margin-bottom: 24px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.asset-value {
  font-size: 24px;
  font-weight: 500;
}

.asset-value .amount {
  margin-right: 12px;
}

.asset-value .change {
  font-size: 16px;
}

.change.positive {
  color: var(--el-color-success);
}

.change.negative {
  color: var(--el-color-danger);
}

.asset-distribution {
  margin-bottom: 40px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 24px;
}

.actions {
  display: flex;
  gap: 16px;
}

.search-input {
  width: 240px;
}

.asset-cell {
  display: flex;
  align-items: center;
  gap: 12px;
}

.asset-icon {
  width: 32px;
  height: 32px;
}

.asset-info {
  display: flex;
  flex-direction: column;
}

.asset-symbol {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

.asset-name {
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.fiat-value {
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.deposit-content,
.withdraw-content {
  padding: 20px;
}

.qr-code {
  text-align: center;
  margin-bottom: 24px;
}

.qr-placeholder {
  width: 200px;
  height: 200px;
  background: #f5f7fa;
  margin: 0 auto;
  border: 1px solid var(--el-border-color);
}

.deposit-address {
  margin-bottom: 24px;
}

.deposit-notice {
  background: var(--el-color-info-light-9);
  padding: 16px;
  border-radius: 4px;
}

.deposit-notice h4 {
  margin-bottom: 12px;
}

.deposit-notice ul {
  padding-left: 20px;
}

.amount-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 4px;
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.withdraw-summary {
  margin-top: 24px;
  padding: 16px;
  background: var(--el-color-info-light-9);
  border-radius: 4px;
}

.summary-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.summary-item:last-child {
  margin-bottom: 0;
  font-weight: 500;
}

@media (max-width: 768px) {
  .overview-section,
  .assets-list-section {
    padding: 20px;
  }

  .section-content h1 {
    font-size: 24px;
    margin-bottom: 24px;
  }

  .section-header {
    flex-direction: column;
    align-items: stretch;
    gap: 16px;
  }

  .actions {
    flex-direction: column;
  }

  .search-input {
    width: 100%;
  }
}
</style>
