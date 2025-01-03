<template>
  <div class="home-page">
    <!-- Hero Section -->
    <section class="hero-section">
      <div class="hero-content">
        <h1>Trade Crypto with Confidence</h1>
        <p class="hero-subtitle">
          Join millions of traders worldwide on the most trusted cryptocurrency trading platform
        </p>
        <div class="hero-cta">
          <el-button type="primary" size="large" @click="$router.push('/register')">
            Get Started
          </el-button>
          <el-button size="large" @click="$router.push('/markets')">
            View Markets
          </el-button>
        </div>
        <div class="hero-stats">
          <div class="stat-item">
            <h3>$2B+</h3>
            <p>24h Trading Volume</p>
          </div>
          <div class="stat-item">
            <h3>2M+</h3>
            <p>Global Users</p>
          </div>
          <div class="stat-item">
            <h3>100+</h3>
            <p>Trading Pairs</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Market Overview Section -->
    <section class="market-section">
      <div class="section-content">
        <h2>Popular Markets</h2>
        <div class="market-grid">
          <div v-for="market in topMarkets" :key="market.symbol" class="market-card">
            <div class="market-info">
              <div class="market-name">
                <img :src="market.icon" :alt="market.name" class="market-icon" />
                <span>{{ market.symbol }}</span>
              </div>
              <div class="market-price">
                <span class="price">${{ formatPrice(market.price) }}</span>
                <span
                  :class="[
                    'price-change',
                    market.priceChange >= 0 ? 'positive' : 'negative'
                  ]"
                >
                  {{ formatPercent(market.priceChange) }}
                </span>
              </div>
            </div>
            <div class="market-chart">
              <!-- Mini chart component would go here -->
            </div>
          </div>
        </div>
        <div class="view-all">
          <el-button type="primary" text @click="$router.push('/markets')">
            View All Markets
            <el-icon><ArrowRight /></el-icon>
          </el-button>
        </div>
      </div>
    </section>

    <!-- Features Section -->
    <section class="features-section">
      <div class="section-content">
        <h2>Why Choose Foiex</h2>
        <div class="features-grid">
          <div class="feature-card">
            <el-icon class="feature-icon"><Lock /></el-icon>
            <h3>Secure Platform</h3>
            <p>
              Industry-leading security measures to protect your assets and personal information
            </p>
          </div>
          <div class="feature-card">
            <el-icon class="feature-icon"><Lightning /></el-icon>
            <h3>High Performance</h3>
            <p>
              Lightning-fast execution and stable platform performance for seamless trading
            </p>
          </div>
          <div class="feature-card">
            <el-icon class="feature-icon"><Money /></el-icon>
            <h3>Competitive Fees</h3>
            <p>
              Low trading fees and transparent pricing structure to maximize your profits
            </p>
          </div>
          <div class="feature-card">
            <el-icon class="feature-icon"><Service /></el-icon>
            <h3>24/7 Support</h3>
            <p>
              Professional customer support team available around the clock to assist you
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Start Trading Section -->
    <section class="cta-section">
      <div class="section-content">
        <h2>Start Trading Today</h2>
        <p>
          Join Foiex and experience the next generation of cryptocurrency trading
        </p>
        <el-button type="primary" size="large" @click="$router.push('/register')">
          Create Account
        </el-button>
      </div>
    </section>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue';
import { ArrowRight, Lock, Lightning, Money, Service } from '@element-plus/icons-vue';

const topMarkets = ref([
  {
    symbol: 'BTC/USDT',
    name: 'Bitcoin',
    icon: '/crypto-icons/btc.svg',
    price: 45000,
    priceChange: 2.5,
  },
  {
    symbol: 'ETH/USDT',
    name: 'Ethereum',
    icon: '/crypto-icons/eth.svg',
    price: 2800,
    priceChange: 1.8,
  },
  {
    symbol: 'BNB/USDT',
    name: 'BNB',
    icon: '/crypto-icons/bnb.svg',
    price: 380,
    priceChange: -0.5,
  },
  {
    symbol: 'SOL/USDT',
    name: 'Solana',
    icon: '/crypto-icons/sol.svg',
    price: 120,
    priceChange: 5.2,
  },
]);

const formatPrice = (price: number) => {
  return price.toLocaleString('en-US', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  });
};

const formatPercent = (percent: number) => {
  return `${percent >= 0 ? '+' : ''}${percent.toFixed(2)}%`;
};
</script>

<style scoped>
.home-page {
  background: var(--el-bg-color);
}

.hero-section {
  background: linear-gradient(135deg, var(--el-color-primary) 0%, var(--el-color-primary-light-3) 100%);
  color: white;
  padding: 80px 20px;
  text-align: center;
}

.hero-content {
  max-width: 1200px;
  margin: 0 auto;
}

.hero-content h1 {
  font-size: 48px;
  font-weight: 700;
  margin-bottom: 24px;
}

.hero-subtitle {
  font-size: 20px;
  opacity: 0.9;
  margin-bottom: 40px;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.hero-cta {
  display: flex;
  gap: 16px;
  justify-content: center;
  margin-bottom: 60px;
}

.hero-stats {
  display: flex;
  justify-content: center;
  gap: 60px;
}

.stat-item {
  text-align: center;
}

.stat-item h3 {
  font-size: 36px;
  font-weight: 700;
  margin-bottom: 8px;
}

.stat-item p {
  font-size: 16px;
  opacity: 0.9;
}

.section-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 80px 20px;
}

.section-content h2 {
  font-size: 32px;
  font-weight: 600;
  margin-bottom: 40px;
  text-align: center;
}

.market-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 24px;
  margin-bottom: 40px;
}

.market-card {
  background: white;
  border-radius: 12px;
  padding: 24px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.market-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.market-name {
  display: flex;
  align-items: center;
  gap: 12px;
  font-weight: 500;
}

.market-icon {
  width: 32px;
  height: 32px;
}

.market-price {
  text-align: right;
}

.price {
  display: block;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 4px;
}

.price-change {
  font-size: 14px;
  font-weight: 500;
}

.price-change.positive {
  color: var(--el-color-success);
}

.price-change.negative {
  color: var(--el-color-danger);
}

.market-chart {
  height: 60px;
  background: var(--el-bg-color-page);
  border-radius: 8px;
}

.view-all {
  text-align: center;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 32px;
}

.feature-card {
  text-align: center;
  padding: 32px;
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.feature-icon {
  font-size: 32px;
  color: var(--el-color-primary);
  margin-bottom: 24px;
}

.feature-card h3 {
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 16px;
}

.feature-card p {
  color: var(--el-text-color-regular);
  line-height: 1.6;
}

.cta-section {
  background: var(--el-bg-color-page);
  text-align: center;
}

.cta-section h2 {
  margin-bottom: 16px;
}

.cta-section p {
  color: var(--el-text-color-regular);
  margin-bottom: 32px;
  font-size: 18px;
}

@media (max-width: 768px) {
  .hero-content h1 {
    font-size: 36px;
  }

  .hero-subtitle {
    font-size: 18px;
  }

  .hero-stats {
    flex-direction: column;
    gap: 32px;
  }

  .section-content {
    padding: 60px 20px;
  }

  .section-content h2 {
    font-size: 28px;
  }
}
</style>
