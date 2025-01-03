import { defineStore } from 'pinia';
import { ref, computed } from 'vue';
import type { Ticker, OrderBook, Kline } from '../types/market';

export const useMarketStore = defineStore('market', () => {
  const currentSymbol = ref('BTC/USDT');
  const tickers = ref<Record<string, Ticker>>({});
  const orderBook = ref<OrderBook>({ bids: [], asks: [] });
  const klines = ref<Kline[]>([]);
  const interval = ref('1m');

  // 计算属性
  const currentTicker = computed(() => tickers.value[currentSymbol.value]);
  const formattedOrderBook = computed(() => ({
    bids: orderBook.value.bids.slice(0, 20),
    asks: orderBook.value.asks.slice(0, 20).reverse()
  }));

  // Actions
  function setCurrentSymbol(symbol: string) {
    currentSymbol.value = symbol;
  }

  function updateTicker(symbol: string, data: Ticker) {
    tickers.value[symbol] = data;
  }

  function updateOrderBook(data: OrderBook) {
    orderBook.value = data;
  }

  function updateKlines(data: Kline[]) {
    klines.value = data;
  }

  function setInterval(newInterval: string) {
    interval.value = newInterval;
  }

  return {
    currentSymbol,
    tickers,
    orderBook,
    klines,
    interval,
    currentTicker,
    formattedOrderBook,
    setCurrentSymbol,
    updateTicker,
    updateOrderBook,
    updateKlines,
    setInterval
  };
});
