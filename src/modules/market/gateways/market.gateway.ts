import {
  WebSocketGateway,
  WebSocketServer,
  SubscribeMessage,
  OnGatewayConnection,
  OnGatewayDisconnect,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { MarketService } from '../market.service';

@WebSocketGateway({
  cors: {
    origin: '*',
  },
  namespace: 'market',
})
export class MarketGateway implements OnGatewayConnection, OnGatewayDisconnect {
  @WebSocketServer()
  server: Server;

  private subscriptions: Map<string, Set<string>> = new Map();

  constructor(private readonly marketService: MarketService) {}

  handleConnection(client: Socket) {
    console.log(`Client connected: ${client.id}`);
  }

  handleDisconnect(client: Socket) {
    console.log(`Client disconnected: ${client.id}`);
    // Remove all subscriptions for this client
    this.subscriptions.forEach((clients, channel) => {
      clients.delete(client.id);
      if (clients.size === 0) {
        this.subscriptions.delete(channel);
      }
    });
  }

  @SubscribeMessage('subscribe')
  handleSubscribe(client: Socket, payload: { channel: string; symbol: string }) {
    const { channel, symbol } = payload;
    const subscriptionKey = `${channel}:${symbol}`;

    if (!this.subscriptions.has(subscriptionKey)) {
      this.subscriptions.set(subscriptionKey, new Set());
    }

    this.subscriptions.get(subscriptionKey).add(client.id);
    
    // Send initial data
    switch (channel) {
      case 'ticker':
        this.sendTickerUpdate(client, symbol);
        break;
      case 'orderbook':
        this.sendOrderBookUpdate(client, symbol);
        break;
      case 'kline':
        this.sendKlineUpdate(client, symbol);
        break;
    }
  }

  @SubscribeMessage('unsubscribe')
  handleUnsubscribe(client: Socket, payload: { channel: string; symbol: string }) {
    const { channel, symbol } = payload;
    const subscriptionKey = `${channel}:${symbol}`;

    if (this.subscriptions.has(subscriptionKey)) {
      this.subscriptions.get(subscriptionKey).delete(client.id);
      if (this.subscriptions.get(subscriptionKey).size === 0) {
        this.subscriptions.delete(subscriptionKey);
      }
    }
  }

  async broadcastTickerUpdate(symbol: string, data: any) {
    const subscriptionKey = `ticker:${symbol}`;
    const subscribers = this.subscriptions.get(subscriptionKey);
    if (subscribers) {
      this.server.to(Array.from(subscribers)).emit('ticker', { symbol, data });
    }
  }

  async broadcastOrderBookUpdate(symbol: string, data: any) {
    const subscriptionKey = `orderbook:${symbol}`;
    const subscribers = this.subscriptions.get(subscriptionKey);
    if (subscribers) {
      this.server.to(Array.from(subscribers)).emit('orderbook', { symbol, data });
    }
  }

  async broadcastKlineUpdate(symbol: string, data: any) {
    const subscriptionKey = `kline:${symbol}`;
    const subscribers = this.subscriptions.get(subscriptionKey);
    if (subscribers) {
      this.server.to(Array.from(subscribers)).emit('kline', { symbol, data });
    }
  }

  private async sendTickerUpdate(client: Socket, symbol: string) {
    const ticker = await this.marketService.getTicker(symbol);
    client.emit('ticker', { symbol, data: ticker });
  }

  private async sendOrderBookUpdate(client: Socket, symbol: string) {
    const orderBook = await this.marketService.getOrderBook(symbol);
    client.emit('orderbook', { symbol, data: orderBook });
  }

  private async sendKlineUpdate(client: Socket, symbol: string) {
    const klines = await this.marketService.getKlines(symbol);
    client.emit('kline', { symbol, data: klines });
  }
}
