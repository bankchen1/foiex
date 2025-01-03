import { NestFactory } from '@nestjs/core';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';

async function bootstrap() {
  console.log('Starting application...');
  
  const app = await NestFactory.create(AppModule, {
    logger: ['error', 'warn', 'debug', 'log', 'verbose'],
  });
  
  console.log('Application created successfully');
  
  // 启用全局验证管道
  app.useGlobalPipes(new ValidationPipe());
  
  // 启用 CORS
  app.enableCors();
  
  console.log('Configuring Swagger...');
  
  // 配置 Swagger
  const config = new DocumentBuilder()
    .setTitle('加密货币交易所 API')
    .setDescription(`
      ## 行情接口文档
      
      ### 接口说明
      - GET /market/ticker - 获取24小时价格变动数据
      - GET /market/tickers - 获取所有交易对的价格数据
      - GET /market/depth - 获取市场深度数据
      - GET /market/klines - 获取K线数据
      
      ### WebSocket订阅
      - 连接地址: ws://localhost:1212/market
      - 支持实时价格推送
      
      ### 参数说明
      - symbol: 交易对（默认：BTC/USDT）
      - interval: K线间隔（1m, 3m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 8h, 12h, 1d, 3d, 1w, 1M）
      - limit: 返回数据条数限制
    `)
    .setVersion('1.0')
    .addTag('market', '市场数据')
    .build();
    
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api-docs', app, document);
  
  console.log('Swagger configured successfully');
  console.log('Starting server...');

  try {
    await app.listen(1212);
    console.log('应用已启动: http://localhost:1212');
    console.log('API文档地址: http://localhost:1212/api-docs');
  } catch (error) {
    console.error('Failed to start server:', error);
    process.exit(1);
  }
}

bootstrap();