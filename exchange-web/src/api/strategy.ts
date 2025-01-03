import axios from 'axios';
import type { Strategy, StrategyTrade, FollowConfig, FollowStats } from '../types/strategy';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || 'http://143.198.184.117:3000'
});

// 获取策略列表
export async function getStrategies(params?: {
  page?: number;
  limit?: number;
  sort?: string;
  filter?: string;
}): Promise<{ strategies: Strategy[]; total: number }> {
  const { data } = await api.get('/api/strategies', { params });
  return data;
}

// 获取单个策略详情
export async function getStrategy(id: string): Promise<Strategy> {
  const { data } = await api.get(`/api/strategies/${id}`);
  return data;
}

// 获取策略的历史交易
export async function getStrategyTrades(
  id: string,
  params?: { page?: number; limit?: number }
): Promise<{ trades: StrategyTrade[]; total: number }> {
  const { data } = await api.get(`/api/strategies/${id}/trades`, { params });
  return data;
}

// 关注策略
export async function followStrategy(config: Omit<FollowConfig, 'userId' | 'createdAt' | 'updatedAt'>): Promise<{ followId: string }> {
  const { data } = await api.post('/api/follow', config);
  return data;
}

// 更新跟单配置
export async function updateFollowConfig(followId: string, config: Partial<FollowConfig>): Promise<void> {
  await api.put(`/api/follow/${followId}`, config);
}

// 停止跟单
export async function stopFollowing(followId: string): Promise<void> {
  await api.post(`/api/follow/${followId}/stop`);
}

// 获取跟单统计数据
export async function getFollowStats(followId: string): Promise<FollowStats> {
  const { data } = await api.get(`/api/follow/${followId}/stats`);
  return data;
}

// 获取用户的所有跟单配置
export async function getUserFollowConfigs(): Promise<{
  configs: (FollowConfig & { strategy: Strategy })[];
  total: number;
}> {
  const { data } = await api.get('/api/follow/my');
  return data;
}

// WebSocket订阅策略信号
export function subscribeToStrategy(ws: WebSocket, strategyId: string) {
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({
      event: 'subscribe',
      channel: 'strategy',
      strategyId
    }));
  } else {
    console.warn('WebSocket is not connected. Will retry when connection is established.');
    ws.addEventListener('open', () => {
      ws.send(JSON.stringify({
        event: 'subscribe',
        channel: 'strategy',
        strategyId
      }));
    });
  }
}

// 取消订阅策略信号
export function unsubscribeFromStrategy(ws: WebSocket, strategyId: string) {
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({
      event: 'unsubscribe',
      channel: 'strategy',
      strategyId
    }));
  }
}
