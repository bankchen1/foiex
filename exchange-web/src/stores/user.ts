import { defineStore } from 'pinia';
import { ref, computed } from 'vue';
import type { User, UserAssets } from '../types/user';
import { login as apiLogin, register as apiRegister, logout as apiLogout } from '../api/auth';

export const useUserStore = defineStore('user', () => {
  const user = ref<User | null>(null);
  const token = ref<string | null>(localStorage.getItem('token'));
  const assets = ref<UserAssets | null>(null);

  const isLoggedIn = computed(() => !!token.value);

  const setUser = (userData: User | null) => {
    user.value = userData;
  };

  const setToken = (newToken: string | null) => {
    token.value = newToken;
    if (newToken) {
      localStorage.setItem('token', newToken);
    } else {
      localStorage.removeItem('token');
    }
  };

  async function login(email: string, password: string) {
    const { user: userData, token: userToken } = await apiLogin(email, password);
    setUser(userData);
    setToken(userToken);
  }

  async function register(userData: {
    firstName: string;
    lastName: string;
    email: string;
    password: string;
  }) {
    const response = await apiRegister(userData);
    setUser(response.user);
    setToken(response.token);
    localStorage.setItem('token', response.token);
  }

  async function logout() {
    try {
      await apiLogout();
    } finally {
      setUser(null);
      setToken(null);
      assets.value = null;
      localStorage.removeItem('token');
    }
  }

  function updateAssets(newAssets: UserAssets) {
    assets.value = newAssets;
  }

  return {
    user,
    token,
    assets,
    isLoggedIn,
    login,
    register,
    logout,
    setUser,
    setToken,
    updateAssets
  };
});
