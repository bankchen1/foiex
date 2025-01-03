import { Injectable } from '@nestjs/common';
import { Order, OrderSide, OrderStatus, Trade } from '../types/trade.types';
import { SupabaseService } from '../../../shared/supabase/supabase.service';
import { AssetService } from '../../asset/asset.service';

@Injectable()
export class OrderMatchingEngine {
  private orderBooks: Map<string, Order[]> = new Map();

  constructor(
    private readonly supabase: SupabaseService,
    private readonly assetService: AssetService,
  ) {}

  async processOrder(order: Order): Promise<Trade[]> {
    const trades: Trade[] = [];
    const symbol = order.symbol;

    if (!this.orderBooks.has(symbol)) {
      this.orderBooks.set(symbol, []);
    }

    const orderBook = this.orderBooks.get(symbol);
    const matchingOrders = this.findMatchingOrders(order, orderBook);

    for (const matchingOrder of matchingOrders) {
      if (order.filled >= order.amount) break;

      const trade = await this.executeTrade(order, matchingOrder);
      if (trade) {
        trades.push(trade);
      }
    }

    if (order.filled < order.amount && order.type === 'limit') {
      orderBook.push(order);
      this.orderBooks.set(symbol, this.sortOrderBook(orderBook, order.side));
    }

    return trades;
  }

  private findMatchingOrders(order: Order, orderBook: Order[]): Order[] {
    return orderBook.filter((o) => {
      if (o.userId === order.userId) return false;
      if (o.side === order.side) return false;

      if (order.side === OrderSide.BUY) {
        return o.price <= order.price;
      } else {
        return o.price >= order.price;
      }
    });
  }

  private async executeTrade(taker: Order, maker: Order): Promise<Trade | null> {
    const tradeAmount = Math.min(
      taker.amount - taker.filled,
      maker.amount - maker.filled,
    );

    if (tradeAmount <= 0) return null;

    const tradePrice = maker.price;

    // Update order fills
    maker.filled += tradeAmount;
    taker.filled += tradeAmount;

    // Update order statuses
    maker.status = maker.filled === maker.amount ? OrderStatus.FILLED : OrderStatus.PARTIALLY_FILLED;
    taker.status = taker.filled === taker.amount ? OrderStatus.FILLED : OrderStatus.PARTIALLY_FILLED;

    // Create trade record
    const { data: trade, error } = await this.supabase.client
      .from('trades')
      .insert({
        makerOrderId: maker.id,
        takerOrderId: taker.id,
        price: tradePrice,
        amount: tradeAmount,
      })
      .select()
      .single();

    if (error) {
      throw new Error('Failed to create trade record');
    }

    // Update orders in database
    await Promise.all([
      this.updateOrder(maker),
      this.updateOrder(taker),
    ]);

    return trade;
  }

  private async updateOrder(order: Order): Promise<void> {
    const { error } = await this.supabase.client
      .from('orders')
      .update({
        filled: order.filled,
        status: order.status,
        updatedAt: new Date(),
      })
      .eq('id', order.id);

    if (error) {
      throw new Error('Failed to update order');
    }
  }

  private sortOrderBook(orders: Order[], side: OrderSide): Order[] {
    return orders.sort((a, b) => {
      if (side === OrderSide.BUY) {
        return b.price - a.price; // Highest price first for buy orders
      } else {
        return a.price - b.price; // Lowest price first for sell orders
      }
    });
  }
}
