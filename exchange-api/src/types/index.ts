export interface User {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  nickname: string;
  avatar?: string;
  password: string;
  is2FAEnabled: boolean;
  createdAt: number;
  updatedAt: number;
}

export interface Strategy {
  id: string;
  name: string;
  description: string;
  creatorId: string;
  status: 'active' | 'paused' | 'stopped';
  stats: {
    totalReturn: number;
    monthlyReturn: number;
    maxDrawdown: number;
    winRate: number;
    followers: number;
    runningDays: number;
  };
  createdAt: number;
  updatedAt: number;
}

export interface FollowConfig {
  id: string;
  userId: string;
  strategyId: string;
  allocation: number;
  maxLoss: number;
  leverageEnabled: boolean;
  leverage: number;
  status: 'active' | 'paused' | 'stopped';
  createdAt: number;
  updatedAt: number;
}

export interface Trade {
  id: string;
  strategyId: string;
  symbol: string;
  side: 'buy' | 'sell';
  price: string;
  quantity: string;
  profit: string;
  profitPercent: number;
  time: number;
}

export interface Market {
  symbol: string;
  price: string;
  change24h: number;
  volume24h: string;
  high24h: string;
  low24h: string;
  lastUpdate: number;
}
