import { defineStore } from 'pinia';
import { ref, computed } from 'vue';
import type { Strategy, StrategyTrade, FollowConfig, FollowStats } from '../types/strategy';
import * as strategyApi from '../api/strategy';

export const useStrategyStore = defineStore('strategy', () => {
  // State
  const strategies = ref<Strategy[]>([]);
  const currentStrategy = ref<Strategy | null>(null);
  const strategyTrades = ref<StrategyTrade[]>([]);
  const followConfigs = ref<(FollowConfig & { strategy: Strategy })[]>([]);
  const loading = ref(false);
  const error = ref<string | null>(null);

  // Computed
  const activeStrategies = computed(() => 
    strategies.value.filter(s => s.status === 'active')
  );

  const totalFollowProfit = computed(() => {
    // 计算所有跟单的总收益
    return followConfigs.value.reduce((total, config) => {
      const profit = parseFloat(config.strategy.stats.totalReturn.toString());
      return total + (isNaN(profit) ? 0 : profit);
    }, 0);
  });

  // Actions
  async function fetchStrategies(params?: {
    page?: number;
    limit?: number;
    sort?: string;
    filter?: string;
  }) {
    loading.value = true;
    error.value = null;
    try {
      const { strategies: data } = await strategyApi.getStrategies(params);
      strategies.value = data;
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to fetch strategies';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function fetchStrategy(id: string) {
    loading.value = true;
    error.value = null;
    try {
      const data = await strategyApi.getStrategy(id);
      currentStrategy.value = data;
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to fetch strategy';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function fetchStrategyTrades(id: string, params?: { page?: number; limit?: number }) {
    loading.value = true;
    error.value = null;
    try {
      const { trades } = await strategyApi.getStrategyTrades(id, params);
      strategyTrades.value = trades;
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to fetch strategy trades';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function followStrategy(config: Omit<FollowConfig, 'userId' | 'createdAt' | 'updatedAt'>) {
    loading.value = true;
    error.value = null;
    try {
      const { followId } = await strategyApi.followStrategy(config);
      await fetchUserFollowConfigs(); // 刷新用户的跟单配置
      return followId;
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to follow strategy';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function updateFollowConfig(followId: string, config: Partial<FollowConfig>) {
    loading.value = true;
    error.value = null;
    try {
      await strategyApi.updateFollowConfig(followId, config);
      await fetchUserFollowConfigs(); // 刷新用户的跟单配置
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to update follow config';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function stopFollowing(followId: string) {
    loading.value = true;
    error.value = null;
    try {
      await strategyApi.stopFollowing(followId);
      await fetchUserFollowConfigs(); // 刷新用户的跟单配置
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to stop following';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  async function fetchUserFollowConfigs() {
    loading.value = true;
    error.value = null;
    try {
      const { configs } = await strategyApi.getUserFollowConfigs();
      followConfigs.value = configs;
    } catch (e) {
      error.value = e instanceof Error ? e.message : 'Failed to fetch follow configs';
      throw e;
    } finally {
      loading.value = false;
    }
  }

  return {
    // State
    strategies,
    currentStrategy,
    strategyTrades,
    followConfigs,
    loading,
    error,

    // Computed
    activeStrategies,
    totalFollowProfit,

    // Actions
    fetchStrategies,
    fetchStrategy,
    fetchStrategyTrades,
    followStrategy,
    updateFollowConfig,
    stopFollowing,
    fetchUserFollowConfigs
  };
});
