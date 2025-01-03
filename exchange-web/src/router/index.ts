import { createRouter, createWebHistory } from 'vue-router';
import { useUserStore } from '../stores/user';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/Home.vue'),
      meta: { title: '首页' }
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/Login.vue'),
      meta: { title: '登录' }
    },
    {
      path: '/register',
      name: 'register',
      component: () => import('../views/Register.vue'),
      meta: { title: '注册' }
    },
    {
      path: '/trade',
      name: 'trade',
      component: () => import('../views/Trade.vue'),
      meta: { title: '交易', requiresAuth: true }
    },
    {
      path: '/markets',
      name: 'markets',
      component: () => import('../views/Markets.vue'),
      meta: { title: '市场' }
    },
    {
      path: '/assets',
      name: 'assets',
      component: () => import('../views/Assets.vue'),
      meta: { title: '资产', requiresAuth: true }
    },
    {
      path: '/account',
      name: 'account',
      component: () => import('../views/Account.vue'),
      meta: { title: '会员中心', requiresAuth: true },
      children: [
        {
          path: 'assets',
          name: 'account-assets',
          component: () => import('../views/account/Assets.vue'),
          meta: { title: '资产管理' }
        },
        {
          path: 'security',
          name: 'account-security',
          component: () => import('../views/account/Security.vue'),
          meta: { title: '安全设置' }
        }
      ]
    },
    {
      path: '/settings',
      name: 'settings',
      component: () => import('../views/Settings.vue'),
      meta: { title: '设置', requiresAuth: true }
    },
    {
      path: '/:pathMatch(.*)*',
      name: 'not-found',
      component: () => import('../views/NotFound.vue'),
      meta: { title: '404' }
    }
  ]
});

// Navigation guards
router.beforeEach((to, from, next) => {
  const userStore = useUserStore();
  
  // 设置页面标题
  document.title = `${to.meta.title} - Foiex.com`;

  if (to.meta.requiresAuth && !userStore.isLoggedIn) {
    next({ name: 'login', query: { redirect: to.fullPath } });
  } else {
    next();
  }
});

export default router;
