<template>
  <div class="following-strategies-page">
    <div class="section-content">
      <!-- Overview -->
      <section class="overview">
        <el-row :gutter="20">
          <el-col :span="8">
            <el-card>
              <template #header>
                <div class="card-header">
                  <span>Total Following</span>
                </div>
              </template>
              <div class="stat-value">{{ followConfigs.length }}</div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card>
              <template #header>
                <div class="card-header">
                  <span>Total Profit</span>
                </div>
              </template>
              <div class="stat-value" :class="{ 'positive': totalFollowProfit >= 0, 'negative': totalFollowProfit < 0 }">
                {{ formatPercent(totalFollowProfit) }}
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card>
              <template #header>
                <div class="card-header">
                  <span>Active Strategies</span>
                </div>
              </template>
              <div class="stat-value">
                {{ followConfigs.filter(c => c.status === 'active').length }}
              </div>
            </el-card>
          </el-col>
        </el-row>
      </section>

      <!-- Following List -->
      <section class="following-list">
        <el-card>
          <template #header>
            <div class="card-header">
              <h2>Following Strategies</h2>
              <el-button type="primary" @click="$router.push('/strategies')">
                Follow New Strategy
              </el-button>
            </div>
          </template>

          <el-table
            v-loading="loading"
            :data="followConfigs"
            style="width: 100%"
          >
            <!-- Strategy Info -->
            <el-table-column label="Strategy" min-width="250">
              <template #default="{ row }">
                <div class="strategy-cell">
                  <el-avatar :size="32" :src="row.strategy.creator.avatar">
                    {{ row.strategy.creator.name.charAt(0) }}
                  </el-avatar>
                  <div class="strategy-info">
                    <div class="strategy-name">{{ row.strategy.name }}</div>
                    <div class="creator-name">by {{ row.strategy.creator.name }}</div>
                  </div>
                </div>
              </template>
            </el-table-column>

            <!-- Allocation -->
            <el-table-column prop="allocation" label="Allocation" width="120">
              <template #default="{ row }">
                {{ row.allocation }}%
              </template>
            </el-table-column>

            <!-- Max Loss -->
            <el-table-column prop="maxLoss" label="Max Loss" width="120">
              <template #default="{ row }">
                {{ row.maxLoss }}%
              </template>
            </el-table-column>

            <!-- Leverage -->
            <el-table-column label="Leverage" width="120">
              <template #default="{ row }">
                {{ row.leverageEnabled ? `${row.leverage}x` : 'Off' }}
              </template>
            </el-table-column>

            <!-- Status -->
            <el-table-column prop="status" label="Status" width="120">
              <template #default="{ row }">
                <el-tag :type="getStatusType(row.status)">
                  {{ row.status }}
                </el-tag>
              </template>
            </el-table-column>

            <!-- Actions -->
            <el-table-column label="Actions" width="200" fixed="right">
              <template #default="{ row }">
                <el-button-group>
                  <el-button
                    v-if="row.status === 'active'"
                    type="warning"
                    @click="handlePause(row)"
                  >
                    Pause
                  </el-button>
                  <el-button
                    v-if="row.status === 'paused'"
                    type="success"
                    @click="handleResume(row)"
                  >
                    Resume
                  </el-button>
                  <el-button
                    type="danger"
                    @click="handleStop(row)"
                  >
                    Stop
                  </el-button>
                  <el-button
                    type="primary"
                    link
                    @click="handleEdit(row)"
                  >
                    Edit
                  </el-button>
                </el-button-group>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </section>
    </div>

    <!-- Edit Dialog -->
    <el-dialog
      v-model="editDialogVisible"
      title="Edit Follow Settings"
      width="500px"
    >
      <el-form
        v-if="editingConfig"
        ref="editForm"
        :model="editingConfig"
        :rules="formRules"
        label-width="100px"
      >
        <el-form-item label="Allocation" prop="allocation">
          <el-input-number
            v-model="editingConfig.allocation"
            :min="1"
            :max="100"
            :step="1"
            style="width: 200px"
          />
          <span class="input-suffix">%</span>
        </el-form-item>

        <el-form-item label="Max Loss" prop="maxLoss">
          <el-input-number
            v-model="editingConfig.maxLoss"
            :min="1"
            :max="100"
            :step="1"
            style="width: 200px"
          />
          <span class="input-suffix">%</span>
        </el-form-item>

        <el-form-item label="Use Leverage">
          <el-switch v-model="editingConfig.leverageEnabled" />
        </el-form-item>

        <el-form-item label="Leverage" v-if="editingConfig.leverageEnabled">
          <el-select v-model="editingConfig.leverage" style="width: 200px">
            <el-option label="2x" :value="2" />
            <el-option label="3x" :value="3" />
            <el-option label="5x" :value="5" />
            <el-option label="10x" :value="10" />
          </el-select>
        </el-form-item>
      </el-form>

      <template #footer>
        <span class="dialog-footer">
          <el-button @click="editDialogVisible = false">Cancel</el-button>
          <el-button type="primary" @click="handleSaveEdit">
            Save
          </el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { ElMessage, ElMessageBox } from 'element-plus';
import { useStrategyStore } from '../stores/strategy';
import type { FollowConfig } from '../types/strategy';

const router = useRouter();
const strategyStore = useStrategyStore();

// State
const loading = ref(false);
const editDialogVisible = ref(false);
const editingConfig = ref<FollowConfig | null>(null);

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
const followConfigs = computed(() => strategyStore.followConfigs);
const totalFollowProfit = computed(() => strategyStore.totalFollowProfit);

// Methods
function getStatusType(status: FollowConfig['status']) {
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

async function handlePause(config: FollowConfig) {
  try {
    await strategyStore.updateFollowConfig(config.strategyId, { status: 'paused' });
    ElMessage.success('Strategy following paused');
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to pause following');
  }
}

async function handleResume(config: FollowConfig) {
  try {
    await strategyStore.updateFollowConfig(config.strategyId, { status: 'active' });
    ElMessage.success('Strategy following resumed');
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to resume following');
  }
}

async function handleStop(config: FollowConfig) {
  try {
    await ElMessageBox.confirm(
      'Are you sure you want to stop following this strategy? This action cannot be undone.',
      'Warning',
      {
        confirmButtonText: 'Stop Following',
        cancelButtonText: 'Cancel',
        type: 'warning'
      }
    );

    await strategyStore.stopFollowing(config.strategyId);
    ElMessage.success('Successfully stopped following the strategy');
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error(error instanceof Error ? error.message : 'Failed to stop following');
    }
  }
}

function handleEdit(config: FollowConfig) {
  editingConfig.value = { ...config };
  editDialogVisible.value = true;
}

async function handleSaveEdit() {
  if (!editingConfig.value) return;

  try {
    await strategyStore.updateFollowConfig(editingConfig.value.strategyId, editingConfig.value);
    editDialogVisible.value = false;
    ElMessage.success('Follow settings updated successfully');
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to update follow settings');
  }
}

// Lifecycle
onMounted(async () => {
  loading.value = true;
  try {
    await strategyStore.fetchUserFollowConfigs();
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : 'Failed to load following strategies');
  } finally {
    loading.value = false;
  }
});
</script>

<style scoped>
.following-strategies-page {
  min-height: calc(100vh - 60px);
  background: var(--el-bg-color);
  padding: 40px 20px;
}

.section-content {
  max-width: 1400px;
  margin: 0 auto;
}

.overview {
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

.stat-value {
  font-size: 32px;
  font-weight: 600;
}

.positive {
  color: var(--el-color-success);
}

.negative {
  color: var(--el-color-danger);
}

.strategy-cell {
  display: flex;
  align-items: center;
  gap: 12px;
}

.strategy-info {
  display: flex;
  flex-direction: column;
}

.strategy-name {
  font-weight: 500;
  color: var(--el-text-color-primary);
}

.creator-name {
  font-size: 12px;
  color: var(--el-text-color-secondary);
}

.input-suffix {
  margin-left: 12px;
  color: var(--el-text-color-secondary);
}

@media (max-width: 768px) {
  .following-strategies-page {
    padding: 20px;
  }

  .stat-value {
    font-size: 24px;
  }
}
</style>
