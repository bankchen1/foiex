import { Server, Socket } from 'socket.io';
import { logger } from '../utils/logger';

export function setupWebSocket(io: Server) {
  io.on('connection', (socket: Socket) => {
    logger.info(`Client connected: ${socket.id}`);

    // Handle market data subscriptions
    socket.on('subscribe:market', (symbol: string) => {
      logger.info(`Client ${socket.id} subscribed to market data for ${symbol}`);
      socket.join(`market:${symbol}`);
    });

    socket.on('unsubscribe:market', (symbol: string) => {
      logger.info(`Client ${socket.id} unsubscribed from market data for ${symbol}`);
      socket.leave(`market:${symbol}`);
    });

    // Handle strategy subscriptions
    socket.on('subscribe:strategy', (strategyId: string) => {
      logger.info(`Client ${socket.id} subscribed to strategy ${strategyId}`);
      socket.join(`strategy:${strategyId}`);
    });

    socket.on('unsubscribe:strategy', (strategyId: string) => {
      logger.info(`Client ${socket.id} unsubscribed from strategy ${strategyId}`);
      socket.leave(`strategy:${strategyId}`);
    });

    // Handle disconnection
    socket.on('disconnect', () => {
      logger.info(`Client disconnected: ${socket.id}`);
    });
  });

  // Setup market data broadcasting
  setInterval(() => {
    // This is a placeholder for real market data updates
    // In production, this should be replaced with real market data source
    const mockMarketData = {
      symbol: 'BTC/USDT',
      price: '40000.00',
      change24h: 2.5,
      volume24h: '1000000',
      high24h: '41000.00',
      low24h: '39000.00',
      lastUpdate: Date.now()
    };

    io.to(`market:BTC/USDT`).emit('market:update', mockMarketData);
  }, 1000);
}
