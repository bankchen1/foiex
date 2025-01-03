<template>
  <div class="markets-page">
    <!-- Market Overview -->
    <section class="market-overview">
      <div class="section-content">
        <h1>Markets</h1>
        
        <!-- Market Categories -->
        <div class="market-categories">
          <el-radio-group v-model="currentCategory" size="large">
            <el-radio-button label="all">All</el-radio-button>
            <el-radio-button label="favorites">Favorites</el-radio-button>
            <el-radio-button label="gainers">Top Gainers</el-radio-button>
            <el-radio-button label="losers">Top Losers</el-radio-button>
          </el-radio-group>
        </div>

        <!-- Market Search -->
        <div class="market-search">
          <el-input
            v-model="searchQuery"
            placeholder="Search markets..."
            :prefix-icon="Search"
            clearable
          />
        </div>

        <!-- Market Table -->
        <el-table
          :data="filteredMarkets"
          style="width: 100%"
          :loading="loading"
          @row-click="handleRowClick"
        >
          <el-table-column label="Market" min-width="200">
            <template #default="{ row }">
              <div class="market-cell">
                <img :src="row.icon" :alt="row.name" class="market-icon" />
                <div class="market-info">
                  <span class="market-symbol">{{ row.symbol }}</span>
                  <span class="market-name">{{ row.name }}</span>
                </div>
              </div>
            </template>
          </el-table-column>

          <el-table-column prop="price" label="Price" min-width="150">
            <template #default="{ row }">
              ${{ formatPrice(row.price) }}
            </template>
          </el-table-column>

          <el-table-column prop="priceChange" label="24h Change" min-width="150">
            <template #default="{ row }">
              <span :class="[
                'price-change',
                row.priceChange >= 0 ? 'positive' : 'negative'
              ]">
                {{ formatPercent(row.priceChange) }}
              </span>
            </template>
          </el-table-column>

          <el-table-column prop="volume" label="24h Volume" min-width="150">
            <template #default="{ row }">
              ${{ formatVolume(row.volume) }}
            </template>
          </el-table-column>

          <el-table-column label="Action" width="120" fixed="right">
            <template #default="{ row }">
              <el-button
                type="primary"
                link
                @click.stop="$router.push(`/trade?symbol=${row.symbol}`)"
              >
                Trade
              </el-button>
            </template>
          </el-table-column>
        </el-table>

        <!-- Pagination -->
        <div class="pagination">
          <el-pagination
            v-model:current-page="currentPage"
            v-model:page-size="pageSize"
            :total="totalMarkets"
            :page-sizes="[10, 20, 50, 100]"
            layout="total, sizes, prev, pager, next"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
          />
        </div>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted } from 'vue';
import { useRouter } from 'vue-router';
import { Search } from '@element-plus/icons-vue';
import { useMarketStore } from '../stores/market';

const router = useRouter();
const marketStore = useMarketStore();

// State
const loading = ref(true);
const currentCategory = ref('all');
const searchQuery = ref('');
const currentPage = ref(1);
const pageSize = ref(20);

// Mock data for demonstration
const markets = ref([
  {
    symbol: 'BTC/USDT',
    name: 'Bitcoin',
    icon: '/crypto-icons/btc.svg',
    price: 45000,
    priceChange: 2.5,
    volume: 1500000000
  },
  {
    symbol: 'ETH/USDT',
    name: 'Ethereum',
    icon: '/crypto-icons/eth.svg',
    price: 2800,
    priceChange: 1.8,
    volume: 800000000
  },
  {
    symbol: 'BNB/USDT',
    name: 'BNB',
    icon: '/crypto-icons/bnb.svg',
    price: 380,
    priceChange: -0.5,
    volume: 200000000
  },
  {
    symbol: 'SOL/USDT',
    name: 'Solana',
    icon: '/crypto-icons/sol.svg',
    price: 120,
    priceChange: 5.2,
    volume: 150000000
  }
]);

// Computed
const totalMarkets = computed(() => markets.value.length);

const filteredMarkets = computed(() => {
  let result = [...markets.value];

  // Apply category filter
  if (currentCategory.value === 'favorites') {
    // TODO: Implement favorites filter
  } else if (currentCategory.value === 'gainers') {
    result = result.sort((a, b) => b.priceChange - a.priceChange);
  } else if (currentCategory.value === 'losers') {
    result = result.sort((a, b) => a.priceChange - b.priceChange);
  }

  // Apply search filter
  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase();
    result = result.filter(
      market =>
        market.symbol.toLowerCase().includes(query) ||
        market.name.toLowerCase().includes(query)
    );
  }

  return result;
});

// Methods
const formatPrice = (price: number) => {
  return price.toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });
};

const formatPercent = (percent: number) => {
  return `${percent >= 0 ? '+' : ''}${percent.toFixed(2)}%`;
};

const formatVolume = (volume: number) => {
  return volume.toLocaleString('en-US', {
    maximumFractionDigits: 0
  });
};

const handleRowClick = (row: any) => {
  router.push(`/trade?symbol=${row.symbol}`);
};

const handleSizeChange = (val: number) => {
  pageSize.value = val;
  currentPage.value = 1;
};

const handleCurrentChange = (val: number) => {
  currentPage.value = val;
};

// Lifecycle
onMounted(async () => {
  try {
    // TODO: Fetch market data from API
    await new Promise(resolve => setTimeout(resolve, 1000));
    loading.value = false;
  } catch (error) {
    console.error('Failed to fetch market data:', error);
    loading.value = false;
  }
});

let dataRefreshInterval: NodeJS.Timeout;

onMounted(() => {
  // Refresh market data every 10 seconds
  dataRefreshInterval = setInterval(async () => {
    try {
      // TODO: Implement real-time data update
    } catch (error) {
      console.error('Failed to update market data:', error);
    }
  }, 10000);
});

onUnmounted(() => {
  if (dataRefreshInterval) {
    clearInterval(dataRefreshInterval);
  }
});
</script>

<style scoped>
.markets-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color);
}

.market-overview {
  padding: 40px 20px;
}

.section-content {
  max-width: 1400px;
  margin: 0 auto;
}

.section-content h1 {
  font-size: 32px;
  font-weight: 600;
  margin-bottom: 32px;
}

.market-categories {
  margin-bottom: 24px;
}

.market-search {
  margin-bottom: 24px;
  max-width: 400px;
}

.market-cell {
  display: flex;
  align-items: center;
  gap: 12px;
}

.market-icon {
  width: 32px;
  height: 32px;
}

.market-info {
  display: flex;
  flex-direction: column;
}

.market-symbol {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

.market-name {
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.price-change {
  font-weight: 500;
}

.price-change.positive {
  color: var(--el-color-success);
}

.price-change.negative {
  color: var(--el-color-danger);
}

.pagination {
  margin-top: 24px;
  display: flex;
  justify-content: flex-end;
}

@media (max-width: 768px) {
  .market-categories {
    overflow-x: auto;
    white-space: nowrap;
    padding-bottom: 12px;
  }

  .section-content h1 {
    font-size: 24px;
    margin-bottom: 24px;
  }
}
</style>
