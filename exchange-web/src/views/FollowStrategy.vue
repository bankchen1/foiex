<template>
  <div class="follow-strategy-page">
    <div class="section-content">
      <!-- Strategy Overview -->
      <section class="strategy-overview" v-if="currentStrategy">
        <el-card>
          <template #header>
            <div class="card-header">
              <h2>{{ currentStrategy.name }}</h2>
              <el-tag :type="getStatusType(currentStrategy.status)">
                {{ currentStrategy.status }}
              </el-tag>
            </div>
          </template>
          
          <div class="strategy-stats">
            <div class="stat-item">
              <span class="label">Total Return</span>
              <span class="value" :class="{ 'positive': currentStrategy.stats.totalReturn >= 0, 'negative': currentStrategy.stats.totalReturn < 0 }">
                {{ formatPercent(currentStrategy.stats.totalReturn) }}
              </span>
            </div>
            <div class="stat-item">
              <span class="label">Monthly Return</span>
              <span class="value" :class="{ 'positive': currentStrategy.stats.monthlyReturn >= 0, 'negative': currentStrategy.stats.monthlyReturn < 0 }">
                {{ formatPercent(currentStrategy.stats.monthlyReturn) }}
              </span>
            </div>
            <div class="stat-item">
              <span class="label">Max Drawdown</span>
              <span class="value negative">
                {{ formatPercent(currentStrategy.stats.maxDrawdown) }}
              </span>
            </div>
            <div class="stat-item">
              <span class="label">Win Rate</span>
              <span class="value">
                {{ formatPercent(currentStrategy.stats.winRate) }}
              </span>
            </div>
            <div class="stat-item">
              <span class="label">Followers</span>
              <span class="value">{{ currentStrategy.stats.followers }}</span>
            </div>
            <div class="stat-item">
              <span class="label">Running Days</span>
              <span class="value">{{ currentStrategy.stats.runningDays }}</span>
            </div>
          </div>

          <div class="strategy-description">
            <p>{{ currentStrategy.description }}</p>
          </div>

          <div class="creator-info">
            <el-avatar :src="currentStrategy.creator.avatar" :size="32">
              {{ currentStrategy.creator.name.charAt(0) }}
            </el-avatar>
            <span class="creator-name">{{ currentStrategy.creator.name }}</span>
          </div>
        </el-card>
      </section>

      <!-- Follow Form -->
      <section class="follow-form">
        <el-card>
          <template #header>
            <h3>Follow Settings</h3>
          </template>

          <el-form
            ref="followForm"
            :model="followConfig"
            :rules="formRules"
            label-width="140px"
            @submit.prevent="handleSubmit"
          >
            <!-- Allocation -->
            <el-form-item label="Allocation" prop="allocation">
              <el-input-number
                v-model="followConfig.allocation"
                :min="1"
                :max="100"
                :step="1"
                style="width: 200px"
              />
              <span class="input-suffix">% of your balance</span>
            </el-form-item>

            <!-- Max Loss -->
            <el-form-item label="Max Loss" prop="maxLoss">
              <el-input-number
                v-model="followConfig.maxLoss"
                :min="1"
                :max="100"
                :step="1"
                style="width: 200px"
              />
              <span class="input-suffix">% of allocation</span>
            </el-form-item>

            <!-- Leverage -->
            <el-form-item label="Use Leverage">
              <el-switch v-model="followConfig.leverageEnabled" />
            </el-form-item>

            <el-form-item label="Leverage" v-if="followConfig.leverageEnabled">
              <el-select v-model="followConfig.leverage" style="width: 200px">
                <el-option label="2x" :value="2" />
                <el-option label="3x" :value="3" />
                <el-option label="5x" :value="5" />
                <el-option label="10x" :value="10" />
              </el-select>
            </el-form-item>

            <!-- Risk Warning -->
            <div class="risk-warning">
              <el-alert
                title="Risk Warning"
                type="warning"
                :closable="false"
                show-icon
              >
                <p>Following a strategy involves risk. Please make sure you:</p>
                <ul>
                  <li>Understand the strategy's trading approach</li>
                  <li>Are comfortable with the allocation amount</li>
                  <li>Have set appropriate stop-loss levels</li>
                </ul>
              </el-alert>
            </div>

            <!-- Submit Button -->
            <el-form-item>
              <el-button
                type="primary"
                native-type="submit"
                :loading="loading"
                :disabled="!currentStrategy || currentStrategy.status !== 'active'"
              >
                Start Following
              </el-button>
            </el-form-item>
          </el-form>
        </el-card>
      </section>

      <!-- Strategy Performance -->
      <section class="strategy-performance" v-if="strategyTrades.length > 0">
        <el-card>
          <template #header>
            <h3>Recent Trades</h3>
          </template>

          <el-table :data="strategyTrades" style="width: 100%">
            <el-table-column prop="symbol" label="Symbol" width="120" />
            <el-table-column prop="side" label="Side" width="100">
              <template #default="{ row }">
                <el-tag :type="row.side === 'buy' ? 'success' : 'danger'">
                  {{ row.side.toUpperCase() }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="price" label="Price" width="120" />
            <el-table-column prop="quantity" label="Quantity" width="120" />
            <el-table-column prop="profit" label="Profit" width="120">
              <template #default="{ row }">
                <span :class="{ 'positive': parseFloat(row.profit) >= 0, 'negative': parseFloat(row.profit) < 0 }">
                  {{ row.profit }} ({{ formatPercent(row.profitPercent) }})
                </span>
              </template>
            </el-table-column>
            <el-table-column prop="time" label="Time" min-width="180">
              <template #default="{ row }">
                {{ formatDate(row.time) }}
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </section>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { ElMessage } from 'element-plus';
import { useStrategyStore } from '../stores/strategy';
import type { Strategy } from '../types/strategy';

const route = useRoute();
const router = useRouter();
const strategyStore = useStrategyStore();

// State
const loading = ref(false);
const followConfig = ref({
  allocation: 10,
  maxLoss: 20,
  leverageEnabled: false,
  leverage: 2,
  status: 'active' as const
});

// Form validation rules
const formRules = {
  allocation: [
    { required: true, message: 'Please input allocation percentage', trigger: 'blur' },
    { type: 'number', min: 1, max: 100, message: 'Allocation must be between 1 and 100', trigger: 'blur' }
  ],
  maxLoss: [
    { required: true, message: 'Please input max loss percentage', trigger: 'blur' },
    { type: 'number', min: 1, max: 100, message: 'Max loss must be between 1 and 100', trigger: 'blur' }
  ]
};

// Computed
const currentStrategy = computed(() => strategyStore.currentStrategy);
const strategyTrades = computed(() => strategyStore.strategyTrades);

// Methods
function getStatusType(status: Strategy['status']) {
  switch (status) {
    case 'active':
      return 'success';
    case 'paused':
      return 'warning';
    case 'stopped':
      return 'danger';
    default:
      return 'info';
  }
}

function formatPercent(value: number) {
  return `${value >= 0 ? '+' : ''}${value.toFixed(2)}%`;
}

function formatDate(timestamp: number) {
  return new Date(timestamp).toLocaleString();
}

async function handleSubmit() {
  if (!currentStrategy.value) return;

  loading.value = true;
  try {
    const config = {
      strategyId: currentStrategy.value.id,
      ...followConfig.value
    };

    await strategyStore.followStrategy(config);
    ElMessage.success('Successfully started following the strategy');
    router.push('/strategies/following');
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to follow strategy');
  } finally {
    loading.value = false;
  }
}

// Lifecycle
onMounted(async () => {
  const strategyId = route.params.id as string;
  if (!strategyId) {
    router.push('/strategies');
    return;
  }

  loading.value = true;
  try {
    await strategyStore.fetchStrategy(strategyId);
    await strategyStore.fetchStrategyTrades(strategyId, { limit: 10 });
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to load strategy');
    router.push('/strategies');
  } finally {
    loading.value = false;
  }
});
</script>

<style scoped>
.follow-strategy-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color);
  padding: 40px 20px;
}

.section-content {
  max-width: 1200px;
  margin: 0 auto;
}

.strategy-overview,
.follow-form,
.strategy-performance {
  margin-bottom: 40px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-header h2 {
  margin: 0;
  font-size: 24px;
  font-weight: 600;
}

.strategy-stats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 24px;
  margin-bottom: 24px;
}

.stat-item {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.stat-item .label {
  color: var(--el-text-color-secondary);
  font-size: 14px;
}

.stat-item .value {
  font-size: 24px;
  font-weight: 500;
}

.positive {
  color: var(--el-color-success);
}

.negative {
  color: var(--el-color-danger);
}

.strategy-description {
  margin-bottom: 24px;
  color: var(--el-text-color-regular);
  line-height: 1.6;
}

.creator-info {
  display: flex;
  align-items: center;
  gap: 12px;
}

.creator-name {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

.input-suffix {
  margin-left: 12px;
  color: var(--el-text-color-secondary);
}

.risk-warning {
  margin: 24px 0;
}

.risk-warning ul {
  margin: 8px 0 0 20px;
}

@media (max-width: 768px) {
  .follow-strategy-page {
    padding: 20px;
  }

  .strategy-stats {
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }

  .stat-item .value {
    font-size: 20px;
  }
}
</style>
