<template>
  <div class="account-page">
    <div class="account-container">
      <el-row :gutter="20">
        <!-- 左侧导航 -->
        <el-col :span="6">
          <div class="nav-menu">
            <div class="user-info">
              <el-avatar :size="64" :src="userStore.user?.avatar">
                {{ userStore.user?.nickname?.charAt(0).toUpperCase() }}
              </el-avatar>
              <h3>{{ userStore.user?.nickname }}</h3>
              <p>{{ userStore.user?.email }}</p>
            </div>
            <el-menu
              router
              :default-active="$route.path"
              class="account-menu"
            >
              <el-menu-item index="/account/assets">
                <el-icon><Wallet /></el-icon>
                <span>资产管理</span>
              </el-menu-item>
              <el-menu-item index="/account/orders">
                <el-icon><List /></el-icon>
                <span>订单记录</span>
              </el-menu-item>
              <el-menu-item index="/account/security">
                <el-icon><Lock /></el-icon>
                <span>安全设置</span>
              </el-menu-item>
              <el-menu-item index="/account/api">
                <el-icon><Key /></el-icon>
                <span>API管理</span>
              </el-menu-item>
            </el-menu>
          </div>
        </el-col>

        <!-- 右侧内容 -->
        <el-col :span="18">
          <div class="content-area">
            <router-view v-slot="{ Component }">
              <transition name="fade" mode="out-in">
                <component :is="Component" />
              </transition>
            </router-view>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup lang="ts">
import { Wallet, List, Lock, Key } from '@element-plus/icons-vue';
import { useUserStore } from '../stores/user';

const userStore = useUserStore();
</script>

<style scoped>
.account-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color-page);
  padding: 20px;
}

.account-container {
  max-width: 1200px;
  margin: 0 auto;
}

.nav-menu {
  background: white;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.user-info {
  padding: 20px;
  text-align: center;
  border-bottom: 1px solid var(--el-border-color-light);
}

.user-info h3 {
  margin: 10px 0 5px;
  color: var(--el-text-color-primary);
}

.user-info p {
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.account-menu {
  border-right: none;
}

.content-area {
  background: white;
  border-radius: 8px;
  padding: 20px;
  min-height: 500px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
