import { Injectable, BadRequestException } from '@nestjs/common';
import { SupabaseService } from '../../shared/supabase/supabase.service';
import { OrderMatchingEngine } from './engines/order-matching.engine';
import { CreateOrderDto } from './dto/trade.dto';
import { Order, OrderStatus, Trade } from './types/trade.types';
import { AssetService } from '../asset/asset.service';

@Injectable()
export class TradeService {
  constructor(
    private readonly supabase: SupabaseService,
    private readonly orderMatchingEngine: OrderMatchingEngine,
    private readonly assetService: AssetService,
  ) {}

  async createOrder(userId: string, createOrderDto: CreateOrderDto): Promise<Order> {
    // Validate user has sufficient balance
    const [baseAsset, quoteAsset] = this.getAssetPair(createOrderDto.symbol);
    
    if (createOrderDto.side === 'buy') {
      const requiredAmount = createOrderDto.price * createOrderDto.amount;
      const balance = await this.assetService.getUserBalance(userId, quoteAsset);
      if (balance.balance < requiredAmount) {
        throw new BadRequestException('Insufficient balance');
      }
    } else {
      const balance = await this.assetService.getUserBalance(userId, baseAsset);
      if (balance.balance < createOrderDto.amount) {
        throw new BadRequestException('Insufficient balance');
      }
    }

    // Create order
    const { data: order, error } = await this.supabase.client
      .from('orders')
      .insert({
        userId,
        symbol: createOrderDto.symbol,
        side: createOrderDto.side,
        type: createOrderDto.type,
        price: createOrderDto.price,
        amount: createOrderDto.amount,
        filled: 0,
        status: OrderStatus.PENDING,
      })
      .select()
      .single();

    if (error) {
      throw new Error('Failed to create order');
    }

    // Process order through matching engine
    const trades = await this.orderMatchingEngine.processOrder(order);

    // Emit order book updates
    this.emitOrderBookUpdates(createOrderDto.symbol);

    return order;
  }

  async cancelOrder(userId: string, orderId: string): Promise<Order> {
    const { data: order, error } = await this.supabase.client
      .from('orders')
      .update({
        status: OrderStatus.CANCELLED,
        updatedAt: new Date(),
      })
      .eq('id', orderId)
      .eq('userId', userId)
      .select()
      .single();

    if (error) {
      throw new Error('Failed to cancel order');
    }

    // Emit order book updates
    this.emitOrderBookUpdates(order.symbol);

    return order;
  }

  async getOrderBook(symbol: string): Promise<{ bids: Order[]; asks: Order[] }> {
    const { data: orders, error } = await this.supabase.client
      .from('orders')
      .select('*')
      .eq('symbol', symbol)
      .in('status', [OrderStatus.PENDING, OrderStatus.PARTIALLY_FILLED]);

    if (error) {
      throw new Error('Failed to fetch order book');
    }

    return {
      bids: orders.filter((order) => order.side === 'buy').sort((a, b) => b.price - a.price),
      asks: orders.filter((order) => order.side === 'sell').sort((a, b) => a.price - b.price),
    };
  }

  async getUserOrders(userId: string): Promise<Order[]> {
    const { data: orders, error } = await this.supabase.client
      .from('orders')
      .select('*')
      .eq('userId', userId)
      .order('createdAt', { ascending: false });

    if (error) {
      throw new Error('Failed to fetch user orders');
    }

    return orders;
  }

  async getUserTrades(userId: string): Promise<Trade[]> {
    const { data: trades, error } = await this.supabase.client
      .from('trades')
      .select('*, makerOrder:orders!makerOrderId(*), takerOrder:orders!takerOrderId(*)')
      .or(`makerOrder.userId.eq.${userId},takerOrder.userId.eq.${userId}`)
      .order('createdAt', { ascending: false });

    if (error) {
      throw new Error('Failed to fetch user trades');
    }

    return trades;
  }

  private getAssetPair(symbol: string): [string, string] {
    const [base, quote] = symbol.split('/');
    return [base, quote];
  }

  private emitOrderBookUpdates(symbol: string): void {
    // This will be implemented with WebSocket
  }
}
