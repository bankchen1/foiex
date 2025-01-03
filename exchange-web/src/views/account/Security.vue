<template>
  <div class="security-page">
    <h2>安全设置</h2>

    <!-- 安全等级 -->
    <el-card class="security-level">
      <template #header>
        <div class="card-header">
          <span>安全等级</span>
          <el-rate
            v-model="securityLevel"
            :max="3"
            disabled
            show-score
            text-color="#ff9900"
          />
        </div>
      </template>
      <div class="security-tips">
        <el-alert
          v-if="securityLevel < 3"
          type="warning"
          :closable="false"
          show-icon
        >
          建议开启所有安全验证，提高账户安全性
        </el-alert>
      </div>
    </el-card>

    <!-- 安全选项列表 -->
    <div class="security-list">
      <!-- 登录密码 -->
      <el-card class="security-item">
        <div class="security-item-content">
          <div class="item-info">
            <el-icon class="security-icon"><Lock /></el-icon>
            <div class="item-details">
              <h3>登录密码</h3>
              <p>用于登录和重要操作验证</p>
            </div>
          </div>
          <div class="item-action">
            <el-button link @click="showChangePasswordDialog = true">
              修改
            </el-button>
          </div>
        </div>
      </el-card>

      <!-- Google验证器 -->
      <el-card class="security-item">
        <div class="security-item-content">
          <div class="item-info">
            <el-icon class="security-icon"><Key /></el-icon>
            <div class="item-details">
              <h3>Google验证器</h3>
              <p>用于登录和提现等操作的双重验证</p>
            </div>
          </div>
          <div class="item-action">
            <el-button
              v-if="!userStore.user?.is2FAEnabled"
              type="primary"
              @click="showEnable2FADialog = true"
            >
              开启
            </el-button>
            <el-button
              v-else
              type="danger"
              @click="showDisable2FADialog = true"
            >
              关闭
            </el-button>
          </div>
        </div>
      </el-card>

      <!-- 邮箱验证 -->
      <el-card class="security-item">
        <div class="security-item-content">
          <div class="item-info">
            <el-icon class="security-icon"><Message /></el-icon>
            <div class="item-details">
              <h3>邮箱验证</h3>
              <p>{{ userStore.user?.email }}</p>
            </div>
          </div>
          <div class="item-action">
            <el-button link @click="showChangeEmailDialog = true">
              修改
            </el-button>
          </div>
        </div>
      </el-card>

      <!-- 登录历史 -->
      <el-card class="security-item">
        <div class="security-item-content">
          <div class="item-info">
            <el-icon class="security-icon"><List /></el-icon>
            <div class="item-details">
              <h3>登录历史</h3>
              <p>查看账户的登录记录</p>
            </div>
          </div>
          <div class="item-action">
            <el-button link @click="showLoginHistoryDialog = true">
              查看
            </el-button>
          </div>
        </div>
      </el-card>
    </div>

    <!-- 修改密码对话框 -->
    <el-dialog
      v-model="showChangePasswordDialog"
      title="修改登录密码"
      width="400px"
    >
      <el-form
        ref="passwordFormRef"
        :model="passwordForm"
        :rules="passwordRules"
        label-width="100px"
      >
        <el-form-item label="当前密码" prop="currentPassword">
          <el-input
            v-model="passwordForm.currentPassword"
            type="password"
            show-password
          />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input
            v-model="passwordForm.newPassword"
            type="password"
            show-password
          />
        </el-form-item>
        <el-form-item label="确认新密码" prop="confirmPassword">
          <el-input
            v-model="passwordForm.confirmPassword"
            type="password"
            show-password
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showChangePasswordDialog = false">取消</el-button>
          <el-button
            type="primary"
            @click="handleChangePassword"
            :loading="submitting"
          >
            确认
          </el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 开启2FA对话框 -->
    <el-dialog
      v-model="showEnable2FADialog"
      title="开启Google验证器"
      width="400px"
    >
      <el-steps :active="enable2FAStep" finish-status="success">
        <el-step title="下载应用" />
        <el-step title="扫描二维码" />
        <el-step title="验证" />
      </el-steps>

      <div class="step-content" v-if="enable2FAStep === 1">
        <h4>1. 下载并安装Google Authenticator</h4>
        <div class="app-downloads">
          <a href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2" target="_blank">
            <img src="@/assets/google-play.svg" alt="Google Play" />
          </a>
          <a href="https://apps.apple.com/app/google-authenticator/id388497605" target="_blank">
            <img src="@/assets/app-store.svg" alt="App Store" />
          </a>
        </div>
        <el-button type="primary" @click="enable2FAStep = 2">下一步</el-button>
      </div>

      <div class="step-content" v-else-if="enable2FAStep === 2">
        <h4>2. 扫描二维码</h4>
        <div class="qr-container">
          <img :src="twoFAQRCode" alt="2FA QR Code" />
        </div>
        <div class="backup-key">
          <p>备份密钥（请妥善保管）：</p>
          <el-input v-model="twoFASecret" readonly>
            <template #append>
              <el-button @click="copySecret">复制</el-button>
            </template>
          </el-input>
        </div>
        <el-button type="primary" @click="enable2FAStep = 3">下一步</el-button>
      </div>

      <div class="step-content" v-else>
        <h4>3. 输入验证码</h4>
        <el-form
          ref="verify2FAFormRef"
          :model="verify2FAForm"
          :rules="verify2FARules"
        >
          <el-form-item prop="code">
            <el-input
              v-model="verify2FAForm.code"
              placeholder="请输入6位验证码"
              maxlength="6"
            />
          </el-form-item>
        </el-form>
        <el-button
          type="primary"
          @click="handleEnable2FA"
          :loading="submitting"
        >
          确认开启
        </el-button>
      </div>
    </el-dialog>

    <!-- 关闭2FA对话框 -->
    <el-dialog
      v-model="showDisable2FADialog"
      title="关闭Google验证器"
      width="400px"
    >
      <el-alert
        type="warning"
        :closable="false"
        show-icon
      >
        关闭双重验证将降低账户安全性，建议保持开启状态
      </el-alert>
      <el-form
        ref="disable2FAFormRef"
        :model="disable2FAForm"
        :rules="disable2FARules"
        class="disable-2fa-form"
      >
        <el-form-item label="登录密码" prop="password">
          <el-input
            v-model="disable2FAForm.password"
            type="password"
            show-password
          />
        </el-form-item>
        <el-form-item label="验证码" prop="code">
          <el-input
            v-model="disable2FAForm.code"
            placeholder="请输入6位验证码"
            maxlength="6"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="showDisable2FADialog = false">取消</el-button>
          <el-button
            type="danger"
            @click="handleDisable2FA"
            :loading="submitting"
          >
            确认关闭
          </el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 登录历史对话框 -->
    <el-dialog
      v-model="showLoginHistoryDialog"
      title="登录历史"
      width="600px"
    >
      <el-table :data="loginHistory" stripe>
        <el-table-column prop="time" label="时间" width="180" />
        <el-table-column prop="ip" label="IP地址" width="140" />
        <el-table-column prop="location" label="地点" />
        <el-table-column prop="device" label="设备" />
        <el-table-column prop="status" label="状态">
          <template #default="{ row }">
            <el-tag :type="row.status === 'success' ? 'success' : 'danger'">
              {{ row.status === 'success' ? '成功' : '失败' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue';
import { useToast } from 'vue-toastification';
import { Lock, Key, Message, List } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import { useUserStore } from '../../stores/user';

const toast = useToast();
const userStore = useUserStore();

// 状态变量
const submitting = ref(false);
const showChangePasswordDialog = ref(false);
const showEnable2FADialog = ref(false);
const showDisable2FADialog = ref(false);
const showLoginHistoryDialog = ref(false);
const enable2FAStep = ref(1);

// 2FA数据
const twoFAQRCode = ref('');
const twoFASecret = ref('');

// 表单数据
const passwordForm = ref({
  currentPassword: '',
  newPassword: '',
  confirmPassword: ''
});

const verify2FAForm = ref({
  code: ''
});

const disable2FAForm = ref({
  password: '',
  code: ''
});

// 安全等级计算
const securityLevel = computed(() => {
  let level = 1; // 基础等级（有登录密码）
  if (userStore.user?.is2FAEnabled) level++;
  if (userStore.user?.email) level++;
  return level;
});

// 模拟登录历史数据
const loginHistory = ref([
  {
    time: '2025-01-02 20:15:30',
    ip: '192.168.1.1',
    location: '中国，北京',
    device: 'Chrome / Windows',
    status: 'success'
  },
  {
    time: '2025-01-01 15:30:20',
    ip: '192.168.1.2',
    location: '中国，上海',
    device: 'Safari / macOS',
    status: 'success'
  }
]);

// 表单验证规则
const passwordRules: FormRules = {
  currentPassword: [
    { required: true, message: '请输入当前密码', trigger: 'blur' }
  ],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认新密码', trigger: 'blur' },
    {
      validator: (rule, value, callback) => {
        if (value !== passwordForm.value.newPassword) {
          callback(new Error('两次输入的密码不一致'));
        } else {
          callback();
        }
      },
      trigger: 'blur'
    }
  ]
};

const verify2FARules: FormRules = {
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { len: 6, message: '验证码必须是6位', trigger: 'blur' }
  ]
};

const disable2FARules: FormRules = {
  password: [
    { required: true, message: '请输入登录密码', trigger: 'blur' }
  ],
  code: [
    { required: true, message: '请输入验证码', trigger: 'blur' },
    { len: 6, message: '验证码必须是6位', trigger: 'blur' }
  ]
};

// 处理函数
const handleChangePassword = async () => {
  const formEl = document.querySelector('form') as FormInstance | null;
  if (!formEl) return;

  try {
    await formEl.validate();
    submitting.value = true;

    // TODO: 调用API修改密码
    await new Promise(resolve => setTimeout(resolve, 1000));

    toast.success('密码修改成功，请重新登录');
    showChangePasswordDialog.value = false;
    userStore.logout();
  } catch (error: any) {
    toast.error(error.message || '密码修改失败');
  } finally {
    submitting.value = false;
  }
};

const handleEnable2FA = async () => {
  const formEl = document.querySelector('form') as FormInstance | null;
  if (!formEl) return;

  try {
    await formEl.validate();
    submitting.value = true;

    // TODO: 调用API验证并启用2FA
    await new Promise(resolve => setTimeout(resolve, 1000));

    toast.success('Google验证器开启成功');
    showEnable2FADialog.value = false;
  } catch (error: any) {
    toast.error(error.message || '验证失败');
  } finally {
    submitting.value = false;
  }
};

const handleDisable2FA = async () => {
  const formEl = document.querySelector('form') as FormInstance | null;
  if (!formEl) return;

  try {
    await formEl.validate();
    submitting.value = true;

    // TODO: 调用API关闭2FA
    await new Promise(resolve => setTimeout(resolve, 1000));

    toast.success('Google验证器已关闭');
    showDisable2FADialog.value = false;
  } catch (error: any) {
    toast.error(error.message || '操作失败');
  } finally {
    submitting.value = false;
  }
};

const copySecret = async () => {
  try {
    await navigator.clipboard.writeText(twoFASecret.value);
    toast.success('密钥已复制');
  } catch (error) {
    toast.error('复制失败，请手动复制');
  }
};
</script>

<style scoped>
.security-page {
  padding: 20px;
}

.security-level {
  margin-bottom: 30px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.security-list {
  display: grid;
  gap: 20px;
}

.security-item-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.item-info {
  display: flex;
  align-items: center;
  gap: 15px;
}

.security-icon {
  font-size: 24px;
  color: var(--el-color-primary);
}

.item-details h3 {
  margin: 0;
  margin-bottom: 5px;
}

.item-details p {
  margin: 0;
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.step-content {
  padding: 20px 0;
  text-align: center;
}

.app-downloads {
  display: flex;
  justify-content: center;
  gap: 20px;
  margin: 20px 0;
}

.app-downloads img {
  height: 40px;
}

.qr-container {
  margin: 20px 0;
}

.qr-container img {
  max-width: 200px;
}

.backup-key {
  text-align: left;
  margin: 20px 0;
}

.disable-2fa-form {
  margin-top: 20px;
}
</style>
