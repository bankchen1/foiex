export interface Ticker {
  symbol: string;
  price: string;
  volume: string;
  high: string;
  low: string;
  change: string;
  changePercent: string;
}

export interface OrderBookItem {
  price: string;
  quantity: string;
}

export interface OrderBook {
  bids: OrderBookItem[];
  asks: OrderBookItem[];
}

export interface Kline {
  time: number;
  open: string;
  high: string;
  low: string;
  close: string;
  volume: string;
}

export interface Trade {
  id: string;
  symbol: string;
  side: 'buy' | 'sell';
  price: string;
  quantity: string;
  time: number;
}

export interface Order {
  id: string;
  userId: string;
  symbol: string;
  side: 'buy' | 'sell';
  type: 'limit' | 'market';
  price: string;
  quantity: string;
  filledQuantity: string;
  status: 'pending' | 'filled' | 'canceled';
  createdAt: number;
  updatedAt: number;
}
