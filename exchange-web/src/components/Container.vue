<template>
  <div class="container">
    <slot></slot>
  </div>
</template>

<style scoped>
.container {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

@media (max-width: 1200px) {
  .container {
    max-width: 992px;
  }
}

@media (max-width: 992px) {
  .container {
    max-width: 768px;
  }
}

@media (max-width: 768px) {
  .container {
    max-width: 576px;
  }
}

@media (max-width: 576px) {
  .container {
    max-width: 100%;
    padding: 0 16px;
  }
}
</style>
