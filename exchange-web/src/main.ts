import { createApp } from 'vue';
import { createPinia } from 'pinia';
import ElementPlus from 'element-plus';
import * as ElementPlusIconsVue from '@element-plus/icons-vue';
import Toast from 'vue-toastification';
import App from './App.vue';
import router from './router';

import 'element-plus/dist/index.css';
import 'vue-toastification/dist/index.css';
import './assets/styles/main.css';

const app = createApp(App);

// 注册 Element Plus 图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component);
}

// 配置 Toast
const toastOptions = {
  position: 'top-right',
  timeout: 3000,
  closeOnClick: true,
  pauseOnFocusLoss: true,
  pauseOnHover: true,
  draggable: true,
  draggablePercent: 0.6,
  showCloseButtonOnHover: false,
  hideProgressBar: true,
  closeButton: 'button',
  icon: true,
  rtl: false
};

app.use(createPinia());
app.use(router);
app.use(ElementPlus);
app.use(Toast, toastOptions);

app.mount('#app');
