<template>
  <el-config-provider :locale="locale">
    <div class="app-container">
      <!-- Header -->
      <header class="app-header" v-if="showHeader">
        <div class="header-content">
          <router-link to="/" class="logo">
            <img src="./assets/logo.svg" alt="Foiex Logo" />
            <span>Foiex</span>
          </router-link>

          <nav class="main-nav">
            <router-link to="/trade">Trade</router-link>
            <router-link to="/markets">Markets</router-link>
            <router-link to="/assets">Assets</router-link>
          </nav>

          <div class="user-actions">
            <template v-if="isLoggedIn">
              <el-dropdown trigger="click">
                <el-avatar :size="32" :src="userAvatar">
                  {{ userInitials }}
                </el-avatar>
                <template #dropdown>
                  <el-dropdown-menu>
                    <el-dropdown-item @click="$router.push('/account')">
                      Account
                    </el-dropdown-item>
                    <el-dropdown-item @click="$router.push('/assets')">
                      Assets
                    </el-dropdown-item>
                    <el-dropdown-item @click="$router.push('/settings')">
                      Settings
                    </el-dropdown-item>
                    <el-dropdown-item divided @click="handleLogout">
                      Sign Out
                    </el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </template>
            <template v-else>
              <el-button @click="$router.push('/login')" text>Sign In</el-button>
              <el-button
                type="primary"
                @click="$router.push('/register')"
                class="register-btn"
              >
                Get Started
              </el-button>
            </template>
          </div>
        </div>
      </header>

      <!-- Main Content -->
      <main class="app-main">
        <router-view v-slot="{ Component }">
          <transition name="fade" mode="out-in">
            <component :is="Component" />
          </transition>
        </router-view>
      </main>

      <!-- Footer -->
      <footer class="app-footer" v-if="showFooter">
        <div class="footer-content">
          <div class="footer-section">
            <h3>About</h3>
            <router-link to="/about">About Us</router-link>
            <router-link to="/careers">Careers</router-link>
            <router-link to="/press">Press</router-link>
          </div>
          <div class="footer-section">
            <h3>Products</h3>
            <router-link to="/trade">Trade</router-link>
            <router-link to="/markets">Markets</router-link>
            <router-link to="/assets">Assets</router-link>
          </div>
          <div class="footer-section">
            <h3>Support</h3>
            <router-link to="/help">Help Center</router-link>
            <router-link to="/contact">Contact Us</router-link>
            <router-link to="/status">System Status</router-link>
          </div>
          <div class="footer-section">
            <h3>Legal</h3>
            <router-link to="/privacy">Privacy Policy</router-link>
            <router-link to="/terms">Terms of Service</router-link>
            <router-link to="/compliance">Compliance</router-link>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; {{ currentYear }} Foiex. All rights reserved.</p>
        </div>
      </footer>
    </div>
  </el-config-provider>
</template>

<script setup lang="ts">
import { computed, ref } from 'vue';
import { useRoute } from 'vue-router';
import { useUserStore } from './stores/user';
import { ElConfigProvider } from 'element-plus';
import enUS from 'element-plus/dist/locale/en.mjs';

const route = useRoute();
const userStore = useUserStore();
const locale = ref(enUS);

const currentYear = new Date().getFullYear();

// Compute whether to show header and footer based on route
const showHeader = computed(() => !['login', 'register'].includes(route.name as string));
const showFooter = computed(() => !['login', 'register', 'trade'].includes(route.name as string));

// User-related computed properties
const isLoggedIn = computed(() => userStore.isLoggedIn);
const userAvatar = computed(() => userStore.user?.avatar);
const userInitials = computed(() => {
  const user = userStore.user;
  if (!user?.firstName || !user?.lastName) return '';
  return `${user.firstName[0]}${user.lastName[0]}`.toUpperCase();
});

const handleLogout = async () => {
  try {
    await userStore.logout();
    window.location.href = '/';
  } catch (error) {
    console.error('Logout failed:', error);
  }
};
</script>

<style>
.app-container {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.app-header {
  height: 60px;
  border-bottom: 1px solid var(--el-border-color-lighter);
  background-color: white;
}

.header-content {
  max-width: 1400px;
  margin: 0 auto;
  padding: 0 20px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  display: flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
  color: var(--el-text-color-primary);
  font-size: 20px;
  font-weight: 600;
}

.logo img {
  height: 32px;
  width: 32px;
}

.main-nav {
  display: flex;
  gap: 32px;
}

.main-nav a {
  text-decoration: none;
  color: var(--el-text-color-regular);
  font-weight: 500;
  transition: color 0.2s;
}

.main-nav a:hover,
.main-nav a.router-link-active {
  color: var(--el-color-primary);
}

.user-actions {
  display: flex;
  align-items: center;
  gap: 16px;
}

.register-btn {
  padding: 8px 20px;
}

.app-main {
  flex: 1;
  width: 100%;
}

.app-footer {
  background-color: var(--el-bg-color-page);
  padding: 60px 20px 20px;
  margin-top: auto;
}

.footer-content {
  max-width: 1400px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 40px;
}

.footer-section {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.footer-section h3 {
  font-size: 16px;
  font-weight: 600;
  color: var(--el-text-color-primary);
  margin-bottom: 8px;
}

.footer-section a {
  text-decoration: none;
  color: var(--el-text-color-regular);
  transition: color 0.2s;
}

.footer-section a:hover {
  color: var(--el-color-primary);
}

.footer-bottom {
  max-width: 1400px;
  margin: 40px auto 0;
  padding-top: 20px;
  border-top: 1px solid var(--el-border-color-lighter);
  text-align: center;
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

/* Transitions */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

@media (max-width: 768px) {
  .main-nav {
    display: none;
  }

  .footer-content {
    grid-template-columns: repeat(2, 1fr);
    gap: 30px;
  }
}

@media (max-width: 480px) {
  .footer-content {
    grid-template-columns: 1fr;
    gap: 24px;
  }
}
</style>
