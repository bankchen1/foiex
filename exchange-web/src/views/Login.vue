<template>
  <div class="login-page">
    <div class="login-container">
      <div class="login-header">
        <img src="../assets/logo.svg" alt="Foiex Logo" class="logo" />
        <h2>Welcome Back</h2>
        <p>Sign in to continue trading</p>
      </div>

      <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-position="top"
        @submit.prevent="handleSubmit"
      >
        <el-form-item label="Email" prop="email">
          <el-input
            v-model="form.email"
            type="email"
            placeholder="Enter your email"
            :prefix-icon="Message"
          />
        </el-form-item>

        <el-form-item label="Password" prop="password">
          <el-input
            v-model="form.password"
            type="password"
            placeholder="Enter your password"
            :prefix-icon="Lock"
            show-password
          />
        </el-form-item>

        <el-form-item v-if="show2FA" label="Google Authenticator Code" prop="code2fa">
          <el-input
            v-model="form.code2fa"
            placeholder="Enter 6-digit code"
            :prefix-icon="Key"
            maxlength="6"
          />
        </el-form-item>

        <div class="form-footer">
          <el-checkbox v-model="rememberMe">Remember me</el-checkbox>
          <el-button type="primary" link @click="$router.push('/forgot-password')">
            Forgot Password?
          </el-button>
        </div>

        <el-button
          type="primary"
          native-type="submit"
          class="submit-btn"
          :loading="loading"
        >
          Sign In
        </el-button>

        <div class="divider">
          <span>or continue with</span>
        </div>

        <div class="social-login">
          <el-button class="google-btn">
            <img src="../assets/google.svg" alt="Google" />
            Google
          </el-button>
        </div>

        <div class="register-link">
          Don't have an account?
          <el-button type="primary" link @click="$router.push('/register')">
            Create Account
          </el-button>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue';
import { useRouter } from 'vue-router';
import { useToast } from 'vue-toastification';
import { Message, Lock, Key } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import { useUserStore } from '../stores/user';

const router = useRouter();
const toast = useToast();
const userStore = useUserStore();

const formRef = ref<FormInstance>();
const loading = ref(false);
const rememberMe = ref(false);
const show2FA = ref(false);

const form = reactive({
  email: '',
  password: '',
  code2fa: ''
});

const rules: FormRules = {
  email: [
    { required: true, message: 'Email is required', trigger: 'blur' },
    { type: 'email', message: 'Please enter a valid email', trigger: 'blur' }
  ],
  password: [
    { required: true, message: 'Password is required', trigger: 'blur' },
    { min: 6, message: 'Password must be at least 6 characters', trigger: 'blur' }
  ],
  code2fa: [
    { required: true, message: 'Authentication code is required', trigger: 'blur' },
    { len: 6, message: 'Code must be 6 digits', trigger: 'blur' }
  ]
};

const handleSubmit = async () => {
  if (!formRef.value) return;

  try {
    await formRef.value.validate();
    loading.value = true;

    await userStore.login(form.email, form.password);
    
    if (userStore.user?.is2FAEnabled && !show2FA.value) {
      show2FA.value = true;
      loading.value = false;
      return;
    }

    // 如果需要2FA验证，验证2FA
    if (show2FA.value) {
      // TODO: 验证2FA
    }

    toast.success('Login successful');
    
    // 获取重定向地址或默认跳转到首页
    const redirect = router.currentRoute.value.query.redirect as string || '/';
    router.push(redirect);
  } catch (error: any) {
    toast.error(error.message || 'Login failed, please try again');
  } finally {
    loading.value = false;
  }
};
</script>

<style scoped>
.login-page {
  min-height: calc(100vh - 60px);
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--el-bg-color-page);
  padding: 40px 20px;
}

.login-container {
  width: 100%;
  max-width: 400px;
  padding: 40px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
}

.login-header {
  text-align: center;
  margin-bottom: 40px;
}

.login-header .logo {
  width: 48px;
  height: 48px;
  margin-bottom: 24px;
}

.login-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: var(--el-text-color-primary);
  margin-bottom: 8px;
}

.login-header p {
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.form-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 24px 0;
}

.submit-btn {
  width: 100%;
  height: 44px;
  font-size: 16px;
  font-weight: 600;
}

.divider {
  display: flex;
  align-items: center;
  text-align: center;
  margin: 24px 0;
  color: var(--el-text-color-secondary);
}

.divider::before,
.divider::after {
  content: '';
  flex: 1;
  border-bottom: 1px solid var(--el-border-color-lighter);
}

.divider span {
  padding: 0 16px;
  font-size: 14px;
}

.social-login {
  margin-bottom: 24px;
}

.google-btn {
  width: 100%;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  background: white;
  border: 1px solid var(--el-border-color);
}

.google-btn img {
  width: 20px;
  height: 20px;
}

.register-link {
  text-align: center;
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

:deep(.el-input__wrapper) {
  box-shadow: 0 0 0 1px var(--el-border-color) inset;
  height: 44px;
}

:deep(.el-input__wrapper:hover) {
  box-shadow: 0 0 0 1px var(--el-color-primary) inset;
}

:deep(.el-form-item__label) {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

@media (max-width: 576px) {
  .login-container {
    padding: 30px 20px;
  }
}
</style>
