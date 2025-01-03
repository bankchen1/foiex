export enum OrderSide {
  BUY = 'buy',
  SELL = 'sell',
}

export enum OrderType {
  LIMIT = 'limit',
  MARKET = 'market',
}

export enum OrderStatus {
  PENDING = 'pending',
  PARTIALLY_FILLED = 'partially_filled',
  FILLED = 'filled',
  CANCELLED = 'cancelled',
}

export interface Order {
  id: string;
  userId: string;
  symbol: string;
  side: OrderSide;
  type: OrderType;
  price: number;
  amount: number;
  filled: number;
  status: OrderStatus;
  createdAt: Date;
  updatedAt: Date;
}

export interface Trade {
  id: string;
  makerOrderId: string;
  takerOrderId: string;
  price: number;
  amount: number;
  createdAt: Date;
}
