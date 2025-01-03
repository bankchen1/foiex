<template>
  <div class="not-found">
    <div class="content">
      <img src="../assets/404.svg" alt="404" class="error-image" />
      <h1>404</h1>
      <h2>Page Not Found</h2>
      <p>The page you are looking for doesn't exist or has been moved.</p>
      <el-button type="primary" @click="$router.push('/')">
        Back to Home
      </el-button>
    </div>
  </div>
</template>

<script setup lang="ts">
// No additional logic needed
</script>

<style scoped>
.not-found {
  min-height: calc(100vh - 60px);
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--el-bg-color);
  padding: 40px 20px;
}

.content {
  text-align: center;
  max-width: 400px;
}

.error-image {
  width: 200px;
  height: 200px;
  margin-bottom: 32px;
}

h1 {
  font-size: 64px;
  font-weight: 700;
  color: var(--el-color-primary);
  margin-bottom: 16px;
}

h2 {
  font-size: 24px;
  font-weight: 600;
  color: var(--el-text-color-primary);
  margin-bottom: 16px;
}

p {
  color: var(--el-text-color-secondary);
  margin-bottom: 32px;
}
</style>
