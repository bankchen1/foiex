<template>
  <div class="trade-page">
    <div class="trade-container">
      <!-- 市场选择器 -->
      <div class="market-selector">
        <el-select v-model="currentSymbol" placeholder="选择交易对" @change="handleSymbolChange">
          <el-option
            v-for="symbol in availableSymbols"
            :key="symbol"
            :label="symbol"
            :value="symbol"
          />
        </el-select>
      </div>

      <div class="trade-content">
        <!-- 左侧 - K线图和深度图 -->
        <div class="chart-section">
          <div class="chart-header">
            <div class="price-info">
              <span class="current-price">{{ formatPrice(currentTicker?.price) }}</span>
              <span
                :class="[
                  'price-change',
                  Number(currentTicker?.changePercent) >= 0 ? 'positive' : 'negative'
                ]"
              >
                {{ formatPercent(currentTicker?.changePercent) }}
              </span>
            </div>
            <div class="chart-controls">
              <el-radio-group v-model="timeframe" size="small">
                <el-radio-button label="1m">1分钟</el-radio-button>
                <el-radio-button label="5m">5分钟</el-radio-button>
                <el-radio-button label="15m">15分钟</el-radio-button>
                <el-radio-button label="1h">1小时</el-radio-button>
                <el-radio-button label="4h">4小时</el-radio-button>
                <el-radio-button label="1d">日线</el-radio-button>
              </el-radio-group>
            </div>
          </div>
          <div ref="chartContainer" class="chart-container"></div>
        </div>

        <!-- 右侧 - 订单簿和交易表单 -->
        <div class="trade-panel">
          <!-- 订单簿 -->
          <div class="order-book">
            <h3>订单簿</h3>
            <div class="order-book-content">
              <div class="asks">
                <div
                  v-for="ask in orderBook.asks"
                  :key="ask.price"
                  class="order-row"
                >
                  <span class="price negative">{{ formatPrice(ask.price) }}</span>
                  <span class="amount">{{ formatAmount(ask.quantity) }}</span>
                  <div 
                    class="depth-visualization negative"
                    :style="{ width: (Number(ask.quantity) / maxQuantity * 100) + '%' }"
                  ></div>
                </div>
              </div>
              <div class="spread">
                <span>价差: {{ calculateSpread() }}%</span>
              </div>
              <div class="bids">
                <div
                  v-for="bid in orderBook.bids"
                  :key="bid.price"
                  class="order-row"
                >
                  <span class="price positive">{{ formatPrice(bid.price) }}</span>
                  <span class="amount">{{ formatAmount(bid.quantity) }}</span>
                  <div 
                    class="depth-visualization positive"
                    :style="{ width: (Number(bid.quantity) / maxQuantity * 100) + '%' }"
                  ></div>
                </div>
              </div>
            </div>
          </div>

          <!-- 交易表单 -->
          <div class="trade-form">
            <el-tabs v-model="tradeType">
              <el-tab-pane label="限价交易" name="limit">
                <el-form :model="limitForm" label-width="80px">
                  <el-form-item label="价格">
                    <el-input v-model="limitForm.price" type="number">
                      <template #append>USDT</template>
                    </el-input>
                  </el-form-item>
                  <el-form-item label="数量">
                    <el-input v-model="limitForm.amount" type="number">
                      <template #append>{{ baseCurrency }}</template>
                    </el-input>
                  </el-form-item>
                  <div class="trade-buttons">
                    <el-button type="success" @click="submitOrder('buy')">买入</el-button>
                    <el-button type="danger" @click="submitOrder('sell')">卖出</el-button>
                  </div>
                </el-form>
              </el-tab-pane>
              <el-tab-pane label="市价交易" name="market">
                <el-form :model="marketForm" label-width="80px">
                  <el-form-item label="数量">
                    <el-input v-model="marketForm.amount" type="number">
                      <template #append>{{ baseCurrency }}</template>
                    </el-input>
                  </el-form-item>
                  <div class="trade-buttons">
                    <el-button type="success" @click="submitMarketOrder('buy')">市价买入</el-button>
                    <el-button type="danger" @click="submitMarketOrder('sell')">市价卖出</el-button>
                  </div>
                </el-form>
              </el-tab-pane>
            </el-tabs>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue';
import { useToast } from 'vue-toastification';
import { createChart, ColorType, CrosshairMode } from 'lightweight-charts';
import { useMarketStore } from '../stores/market';
import { useUserStore } from '../stores/user';
import type { OrderBook } from '../types/market';

const toast = useToast();
const marketStore = useMarketStore();
const userStore = useUserStore();

const chartContainer = ref<HTMLElement | null>(null);
const chart = ref<any>(null);
const candlestickSeries = ref<any>(null);
const volumeSeries = ref<any>(null);

const currentSymbol = ref('BTC/USDT');
const timeframe = ref('15m');
const tradeType = ref('limit');
const orderBook = ref<OrderBook>({ asks: [], bids: [] });

const availableSymbols = ['BTC/USDT', 'ETH/USDT', 'BNB/USDT'];

const limitForm = ref({
  price: '',
  amount: ''
});

const marketForm = ref({
  amount: ''
});

const baseCurrency = computed(() => currentSymbol.value.split('/')[0]);
const currentTicker = computed(() => marketStore.currentTicker);

// 计算订单簿中的最大数量，用于深度可视化
const maxQuantity = computed(() => {
  const askMax = Math.max(...orderBook.value.asks.map(ask => Number(ask.quantity)));
  const bidMax = Math.max(...orderBook.value.bids.map(bid => Number(bid.quantity)));
  return Math.max(askMax, bidMax);
});

// 格式化函数
const formatPrice = (price?: string) => {
  if (!price) return '0.00';
  return Number(price).toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 8
  });
};

const formatAmount = (amount?: string) => {
  if (!amount) return '0.00';
  return Number(amount).toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 8
  });
};

const formatPercent = (percent?: string) => {
  if (!percent) return '0.00%';
  return `${Number(percent) >= 0 ? '+' : ''}${Number(percent).toFixed(2)}%`;
};

const calculateSpread = () => {
  if (orderBook.value.asks.length === 0 || orderBook.value.bids.length === 0) {
    return '0.00';
  }
  const lowestAsk = Number(orderBook.value.asks[0].price);
  const highestBid = Number(orderBook.value.bids[0].price);
  return ((lowestAsk - highestBid) / lowestAsk * 100).toFixed(2);
};

// 初始化图表
const initChart = () => {
  if (!chartContainer.value) return;

  chart.value = createChart(chartContainer.value, {
    width: chartContainer.value.clientWidth,
    height: 500,
    layout: {
      background: { color: '#ffffff' },
      textColor: '#333',
    },
    grid: {
      vertLines: { color: '#f0f0f0' },
      horzLines: { color: '#f0f0f0' },
    },
    crosshair: {
      mode: CrosshairMode.Normal,
    },
    rightPriceScale: {
      borderColor: '#f0f0f0',
    },
    timeScale: {
      borderColor: '#f0f0f0',
    },
  });

  candlestickSeries.value = chart.value.addCandlestickSeries({
    upColor: '#26a69a',
    downColor: '#ef5350',
    borderVisible: false,
    wickUpColor: '#26a69a',
    wickDownColor: '#ef5350',
  });

  volumeSeries.value = chart.value.addHistogramSeries({
    color: '#26a69a',
    priceFormat: {
      type: 'volume',
    },
    priceScaleId: '',
    scaleMargins: {
      top: 0.8,
      bottom: 0,
    },
  });

  // 添加窗口大小变化监听
  const handleResize = () => {
    if (chartContainer.value && chart.value) {
      chart.value.applyOptions({
        width: chartContainer.value.clientWidth,
      });
    }
  };

  window.addEventListener('resize', handleResize);
};

// 处理交易对变更
const handleSymbolChange = (symbol: string) => {
  currentSymbol.value = symbol;
  marketStore.setCurrentSymbol(symbol);
  // TODO: 重新获取K线数据和订单簿数据
};

// 提交限价订单
const submitOrder = async (side: 'buy' | 'sell') => {
  if (!userStore.isLoggedIn) {
    toast.error('请先登录');
    return;
  }

  try {
    // TODO: 调用API提交订单
    toast.success(`${side === 'buy' ? '买入' : '卖出'}订单提交成功`);
  } catch (error: any) {
    toast.error(error.message || '订单提交失败');
  }
};

// 提交市价订单
const submitMarketOrder = async (side: 'buy' | 'sell') => {
  if (!userStore.isLoggedIn) {
    toast.error('请先登录');
    return;
  }

  try {
    // TODO: 调用API提交市价订单
    toast.success(`市价${side === 'buy' ? '买入' : '卖出'}订单提交成功`);
  } catch (error: any) {
    toast.error(error.message || '订单提交失败');
  }
};

onMounted(() => {
  initChart();
  // TODO: 初始化WebSocket连接
  // TODO: 订阅K线和订单簿数据
});

onUnmounted(() => {
  if (chart.value) {
    chart.value.remove();
  }
  // TODO: 清理WebSocket连接
});
</script>

<style scoped>
.trade-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color);
  padding: 20px;
}

.trade-container {
  max-width: 1400px;
  margin: 0 auto;
}

.market-selector {
  margin-bottom: 20px;
}

.trade-content {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 20px;
}

.chart-section {
  background: white;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.chart-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.price-info {
  display: flex;
  align-items: center;
  gap: 10px;
}

.current-price {
  font-size: 24px;
  font-weight: bold;
}

.price-change {
  font-size: 16px;
}

.positive {
  color: var(--el-color-success);
}

.negative {
  color: var(--el-color-danger);
}

.chart-container {
  height: 500px;
}

.trade-panel {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.order-book,
.trade-form {
  background: white;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}

.order-book h3 {
  margin-bottom: 15px;
}

.order-book-content {
  display: flex;
  flex-direction: column;
  gap: 10px;
  height: 400px;
}

.asks,
.bids {
  flex: 1;
  overflow-y: auto;
}

.asks {
  display: flex;
  flex-direction: column-reverse;
}

.order-row {
  display: flex;
  justify-content: space-between;
  padding: 4px 0;
  font-family: monospace;
  position: relative;
}

.order-row .price {
  width: 100px;
  font-weight: 500;
}

.order-row .amount {
  width: 100px;
  color: var(--el-text-color-regular);
}

.depth-visualization {
  position: absolute;
  top: 0;
  right: 0;
  height: 100%;
  z-index: 0;
  opacity: 0.1;
}

.depth-visualization.positive {
  background-color: var(--el-color-success);
}

.depth-visualization.negative {
  background-color: var(--el-color-danger);
}

.spread {
  text-align: center;
  padding: 8px;
  background: var(--el-bg-color-page);
  border-radius: 4px;
}

.trade-buttons {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 10px;
  margin-top: 20px;
}

@media (max-width: 1200px) {
  .trade-content {
    grid-template-columns: 1fr;
  }
}
</style>
