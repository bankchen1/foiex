export interface Strategy {
  id: string;
  name: string;
  description: string;
  creator: {
    id: string;
    name: string;
    avatar?: string;
  };
  stats: {
    totalReturn: number;
    monthlyReturn: number;
    maxDrawdown: number;
    winRate: number;
    followers: number;
    runningDays: number;
  };
  status: 'active' | 'paused' | 'stopped';
  createdAt: number;
  updatedAt: number;
}

export interface StrategyTrade {
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

export interface FollowConfig {
  strategyId: string;
  userId: string;
  allocation: number;
  maxLoss: number;
  leverageEnabled: boolean;
  leverage: number;
  status: 'active' | 'paused' | 'stopped';
  createdAt: number;
  updatedAt: number;
}

export interface FollowStats {
  followId: string;
  totalProfit: string;
  totalProfitPercent: number;
  runningDays: number;
  totalTrades: number;
  winningTrades: number;
  losingTrades: number;
}
