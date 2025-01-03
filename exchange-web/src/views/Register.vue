<template>
  <div class="register-page">
    <div class="register-container">
      <div class="register-header">
        <img src="../assets/logo.svg" alt="Foiex Logo" class="logo" />
        <h2>Create Account</h2>
        <p>Join thousands of traders worldwide</p>
      </div>

      <el-form
        ref="formRef"
        :model="form"
        :rules="rules"
        label-position="top"
        @submit.prevent="handleSubmit"
      >
        <el-form-item label="First Name" prop="firstName">
          <el-input
            v-model="form.firstName"
            placeholder="Enter your first name"
            :prefix-icon="User"
          />
        </el-form-item>

        <el-form-item label="Last Name" prop="lastName">
          <el-input
            v-model="form.lastName"
            placeholder="Enter your last name"
            :prefix-icon="User"
          />
        </el-form-item>

        <el-form-item label="Email" prop="email">
          <el-input
            v-model="form.email"
            type="email"
            placeholder="Enter your email"
            :prefix-icon="Message"
          />
        </el-form-item>

        <el-form-item label="Username" prop="nickname">
          <el-input
            v-model="form.nickname"
            placeholder="Choose a username"
            :prefix-icon="User"
          />
        </el-form-item>

        <el-form-item label="Password" prop="password">
          <el-input
            v-model="form.password"
            type="password"
            placeholder="Create a password"
            :prefix-icon="Lock"
            show-password
          />
        </el-form-item>

        <el-form-item label="Confirm Password" prop="confirmPassword">
          <el-input
            v-model="form.confirmPassword"
            type="password"
            placeholder="Confirm your password"
            :prefix-icon="Lock"
            show-password
          />
        </el-form-item>

        <el-form-item class="terms-checkbox">
          <el-checkbox v-model="form.agreeToTerms">
            I agree to the
            <el-button type="primary" link @click="showTerms = true">
              Terms of Service
            </el-button>
            and
            <el-button type="primary" link @click="showPrivacy = true">
              Privacy Policy
            </el-button>
          </el-checkbox>
        </el-form-item>

        <el-button
          type="primary"
          native-type="submit"
          class="submit-btn"
          :loading="loading"
        >
          Create Account
        </el-button>

        <div class="divider">
          <span>or sign up with</span>
        </div>

        <div class="social-login">
          <el-button class="google-btn">
            <img src="../assets/google.svg" alt="Google" />
            Google
          </el-button>
        </div>

        <div class="login-link">
          Already have an account?
          <el-button type="primary" link @click="$router.push('/login')">
            Sign In
          </el-button>
        </div>
      </el-form>
    </div>

    <!-- Terms of Service Dialog -->
    <el-dialog v-model="showTerms" title="Terms of Service" width="50%">
      <div class="terms-content">
        <h3>1. Acceptance of Terms</h3>
        <p>By accessing and using FOIEX.com, you agree to be bound by these Terms of Service and all applicable laws and regulations.</p>
        
        <h3>2. Trading Risks</h3>
        <p>Trading foreign exchange and CFDs carries substantial risks and may not be suitable for all investors. You should carefully consider your investment objectives, level of experience, and risk appetite before making any investment decisions.</p>
        
        <h3>3. Account Security</h3>
        <p>You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>
        
        <h3>4. Trading Rules</h3>
        <p>Users must comply with all applicable trading rules and regulations. Any form of market manipulation or fraudulent activity is strictly prohibited.</p>
      </div>
    </el-dialog>

    <!-- Privacy Policy Dialog -->
    <el-dialog v-model="showPrivacy" title="Privacy Policy" width="50%">
      <div class="privacy-content">
        <h3>1. Information Collection</h3>
        <p>We collect personal information that you provide directly to us when creating an account, including but not limited to your email address, username, and password.</p>
        
        <h3>2. Use of Information</h3>
        <p>We use the information we collect to provide, maintain, and improve our services, to process your transactions, and to communicate with you.</p>
        
        <h3>3. Data Security</h3>
        <p>We implement appropriate security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.</p>
        
        <h3>4. Cookie Policy</h3>
        <p>We use cookies and similar tracking technologies to track activity on our platform and hold certain information to improve your trading experience.</p>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue';
import { useRouter } from 'vue-router';
import { useToast } from 'vue-toastification';
import { Message, Lock, User } from '@element-plus/icons-vue';
import type { FormInstance, FormRules } from 'element-plus';
import { useUserStore } from '../stores/user';

const router = useRouter();
const toast = useToast();
const userStore = useUserStore();

const formRef = ref<FormInstance>();
const loading = ref(false);
const showTerms = ref(false);
const showPrivacy = ref(false);

const form = reactive({
  firstName: '',
  lastName: '',
  email: '',
  nickname: '',
  password: '',
  confirmPassword: '',
  agreeToTerms: false
});

const validatePass = (rule: any, value: string, callback: any) => {
  if (value === '') {
    callback(new Error('Password is required'));
  } else {
    if (form.confirmPassword !== '') {
      if (formRef.value) {
        formRef.value.validateField('confirmPassword');
      }
    }
    callback();
  }
};

const validatePass2 = (rule: any, value: string, callback: any) => {
  if (value === '') {
    callback(new Error('Please confirm your password'));
  } else if (value !== form.password) {
    callback(new Error('Passwords do not match'));
  } else {
    callback();
  }
};

const rules: FormRules = {
  firstName: [
    { required: true, message: 'First name is required', trigger: 'blur' },
    { min: 2, max: 50, message: 'First name must be 2-50 characters', trigger: 'blur' }
  ],
  lastName: [
    { required: true, message: 'Last name is required', trigger: 'blur' },
    { min: 2, max: 50, message: 'Last name must be 2-50 characters', trigger: 'blur' }
  ],
  email: [
    { required: true, message: 'Email is required', trigger: 'blur' },
    { type: 'email', message: 'Please enter a valid email', trigger: 'blur' }
  ],
  nickname: [
    { required: true, message: 'Username is required', trigger: 'blur' },
    { min: 2, max: 20, message: 'Username must be 2-20 characters', trigger: 'blur' }
  ],
  password: [
    { required: true, validator: validatePass, trigger: 'blur' },
    { min: 6, message: 'Password must be at least 6 characters', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, validator: validatePass2, trigger: 'blur' }
  ]
};

const handleSubmit = async () => {
  if (!formRef.value) return;

  if (!form.agreeToTerms) {
    toast.error('Please agree to the Terms of Service and Privacy Policy');
    return;
  }

  try {
    await formRef.value.validate();
    loading.value = true;

    await userStore.register({
      firstName: form.firstName,
      lastName: form.lastName,
      email: form.email,
      nickname: form.nickname,
      password: form.password
    });
    
    toast.success('Registration successful! Please sign in.');
    router.push('/login');
  } catch (error: any) {
    console.error('Registration error:', error);
    toast.error(error.message || 'Registration failed. Please try again.');
    
    // Focus email field if email already exists
    if (error.message.includes('email already exists')) {
      formRef.value?.validateField('email');
    }
  } finally {
    loading.value = false;
  }
};
</script>

<style scoped>
.register-page {
  min-height: calc(100vh - 60px);
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--el-bg-color-page);
  padding: 40px 20px;
}

.register-container {
  width: 100%;
  max-width: 400px;
  padding: 40px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
}

.register-header {
  text-align: center;
  margin-bottom: 40px;
}

.register-header .logo {
  width: 48px;
  height: 48px;
  margin-bottom: 24px;
}

.register-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: var(--el-text-color-primary);
  margin-bottom: 8px;
}

.register-header p {
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.terms-checkbox {
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

.login-link {
  text-align: center;
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.terms-content,
.privacy-content {
  max-height: 400px;
  overflow-y: auto;
  padding: 20px;
  line-height: 1.6;
}

.terms-content h3,
.privacy-content h3 {
  margin: 24px 0 12px;
  color: var(--el-text-color-primary);
  font-size: 16px;
  font-weight: 600;
}

.terms-content h3:first-child,
.privacy-content h3:first-child {
  margin-top: 0;
}

.terms-content p,
.privacy-content p {
  margin-bottom: 16px;
  color: var(--el-text-color-regular);
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
  .register-container {
    padding: 30px 20px;
  }

  .terms-content,
  .privacy-content {
    padding: 16px;
  }
}
</style>
