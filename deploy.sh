#!/bin/bash

# 确保脚本在出错时停止执行
set -e

echo "开始部署 Foiex 项目..."

# 1. 更新系统并安装必要的软件
echo "正在更新系统..."
sudo apt update
sudo apt upgrade -y

# 2. 安装 Node.js 18.x
echo "正在安装 Node.js 18.x..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# 验证 Node.js 版本
node -v
npm -v

# 3. 安装全局依赖
echo "正在安装全局依赖..."
sudo npm install -g pm2 vite

# 4. 设置 npm 配置
echo "配置 npm..."
npm config set registry https://registry.npmmirror.com
npm config set timeout 600000

# 5. 部署前端
echo "正在部署前端..."
cd /home/exchange/foiex/exchange-web
npm install
npm run build

# 6. 部署后端
echo "正在部署后端..."
cd /home/exchange/foiex/exchange-api
npm install
npm run swagger:generate
npm run build

# 7. 启动后端服务
echo "正在启动后端服务..."
pm2 delete foiex-api || true  # 如果存在就删除旧的进程
pm2 start dist/index.js --name "foiex-api"
pm2 save
pm2 startup

echo "部署完成！"
echo "前端文件位置: /home/exchange/foiex/exchange-web/dist"
echo "后端服务已通过 PM2 启动"
echo "请确保已正确配置 Nginx"
