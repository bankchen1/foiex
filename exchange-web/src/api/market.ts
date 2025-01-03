import axios from 'axios';
import type { Ticker, OrderBook, Kline } from '../types/market';

const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || 'http://143.198.184.117:3000'
});

export async function getTicker(symbol: string): Promise<Ticker> {
  const { data } = await api.get(`/api/market/ticker?symbol=${symbol}`);
  return data;
}

export async function getTickers(): Promise<Record<string, Ticker>> {
  const { data } = await api.get('/api/market/tickers');
  return data;
}

export async function getOrderBook(symbol: string): Promise<OrderBook> {
  const { data } = await api.get(`/api/market/depth?symbol=${symbol}`);
  return data;
}

export async function getKlines(symbol: string, interval: string, limit: number = 1000): Promise<Kline[]> {
  const { data } = await api.get(`/api/market/klines?symbol=${symbol}&interval=${interval}&limit=${limit}`);
  return data;
}

// WebSocket连接
export function createWebSocket(): WebSocket {
  const wsUrl = import.meta.env.VITE_WS_BASE_URL || 'ws://143.198.184.117:3000/ws';
  const ws = new WebSocket(wsUrl + '/market');

  ws.onopen = () => {
    console.log('WebSocket connected');
  };

  ws.onerror = (error) => {
    console.error('WebSocket error:', error);
    // 添加重连逻辑
    setTimeout(() => {
      console.log('Attempting to reconnect...');
      createWebSocket();
    }, 5000);
  };

  ws.onclose = () => {
    console.log('WebSocket disconnected');
    // 添加重连逻辑
    setTimeout(() => {
      console.log('Attempting to reconnect...');
      createWebSocket();
    }, 5000);
  };

  return ws;
}

export function subscribeToMarket(ws: WebSocket, symbol: string, channels: string[]) {
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({
      event: 'subscribe',
      symbol,
      channels
    }));
  } else {
    console.warn('WebSocket is not connected. Will retry when connection is established.');
    ws.addEventListener('open', () => {
      ws.send(JSON.stringify({
        event: 'subscribe',
        symbol,
        channels
      }));
    });
  }
}

export function unsubscribeFromMarket(ws: WebSocket, symbol: string, channels: string[]) {
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify({
      event: 'unsubscribe',
      symbol,
      channels
    }));
  }
}
