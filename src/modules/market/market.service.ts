import { Injectable } from '@nestjs/common';
import { SupabaseService } from '../../shared/supabase/supabase.service';
import { TradeService } from '../trade/trade.service';
import { TickerDto, OrderBookDto, KlineDto, OrderBookEntryDto } from './dto/market.dto';

@Injectable()
export class MarketService {
  private tickerCache: Map<string, TickerDto> = new Map();
  private klineCache: Map<string, KlineDto[]> = new Map();

  constructor(
    private readonly supabase: SupabaseService,
    private readonly tradeService: TradeService,
  ) {
    this.startTickerUpdates();
  }

  async getTicker(symbol: string): Promise<TickerDto> {
    return this.tickerCache.get(symbol) || this.calculateTicker(symbol);
  }

  async getTickers(): Promise<TickerDto[]> {
    const symbols = Array.from(this.tickerCache.keys());
    return Promise.all(symbols.map(symbol => this.getTicker(symbol)));
  }

  async getOrderBook(symbol: string, limit: number = 100): Promise<OrderBookDto> {
    const orderBook = await this.tradeService.getOrderBook(symbol);
    return {
      lastUpdateId: Date.now(),
      bids: orderBook.bids.slice(0, limit).map(order => ({
        price: order.price.toString(),
        quantity: (order.amount - order.filled).toString(),
      })),
      asks: orderBook.asks.slice(0, limit).map(order => ({
        price: order.price.toString(),
        quantity: (order.amount - order.filled).toString(),
      })),
    };
  }

  async getKlines(
    symbol: string,
    interval: string = '1h',
    limit: number = 100,
  ): Promise<KlineDto[]> {
    const cacheKey = `${symbol}-${interval}`;
    if (this.klineCache.has(cacheKey)) {
      return this.klineCache.get(cacheKey).slice(-limit);
    }

    const klines = await this.fetchKlines(symbol, interval, limit);
    this.klineCache.set(cacheKey, klines);
    return klines;
  }

  private async calculateTicker(symbol: string): Promise<TickerDto> {
    const { data: trades } = await this.supabase.client
      .from('trades')
      .select('price, amount, createdAt')
      .eq('symbol', symbol)
      .order('createdAt', { ascending: false })
      .limit(100);

    if (!trades || trades.length === 0) {
      const now = Date.now();
      return {
        symbol,
        priceChange: '0',
        priceChangePercent: '0',
        weightedAvgPrice: '0',
        prevClosePrice: '0',
        lastPrice: '0',
        lastQty: '0',
        bidPrice: '0',
        askPrice: '0',
        openPrice: '0',
        highPrice: '0',
        lowPrice: '0',
        volume: '0',
        quoteVolume: '0',
        openTime: now - 24 * 60 * 60 * 1000,
        closeTime: now,
        firstId: 0,
        lastId: 0,
        count: 0
      };
    }

    const last24h = new Date(Date.now() - 24 * 60 * 60 * 1000);
    const last24hTrades = trades.filter(t => new Date(t.createdAt) >= last24h);
    const firstTrade = last24hTrades[last24hTrades.length - 1];
    const lastTrade = last24hTrades[0];

    const ticker: TickerDto = {
      symbol,
      priceChange: (lastTrade.price - firstTrade.price).toString(),
      priceChangePercent: ((lastTrade.price - firstTrade.price) / firstTrade.price * 100).toString(),
      weightedAvgPrice: (last24hTrades.reduce((sum, t) => sum + t.price * t.amount, 0) / 
                        last24hTrades.reduce((sum, t) => sum + t.amount, 0)).toString(),
      prevClosePrice: firstTrade.price.toString(),
      lastPrice: lastTrade.price.toString(),
      lastQty: lastTrade.amount.toString(),
      bidPrice: '0', // Will be updated from order book
      askPrice: '0', // Will be updated from order book
      openPrice: firstTrade.price.toString(),
      highPrice: Math.max(...last24hTrades.map(t => t.price)).toString(),
      lowPrice: Math.min(...last24hTrades.map(t => t.price)).toString(),
      volume: last24hTrades.reduce((sum, t) => sum + t.amount, 0).toString(),
      quoteVolume: last24hTrades.reduce((sum, t) => sum + t.price * t.amount, 0).toString(),
      openTime: new Date(firstTrade.createdAt).getTime(),
      closeTime: new Date(lastTrade.createdAt).getTime(),
      firstId: 0,
      lastId: 0,
      count: last24hTrades.length
    };

    this.tickerCache.set(symbol, ticker);
    return ticker;
  }

  private async fetchKlines(
    symbol: string,
    interval: string,
    limit: number,
  ): Promise<KlineDto[]> {
    const { data: trades } = await this.supabase.client
      .from('trades')
      .select('price, amount, createdAt')
      .eq('symbol', symbol)
      .order('createdAt', { ascending: true })
      .limit(limit);

    if (!trades || trades.length === 0) {
      return [];
    }

    // Group trades by interval and create klines
    const klines: KlineDto[] = [];
    let currentKline: KlineDto | null = null;

    for (const trade of trades) {
      const tradeTime = new Date(trade.createdAt).getTime();
      
      if (!currentKline || tradeTime >= currentKline.closeTime) {
        if (currentKline) {
          klines.push(currentKline);
        }
        
        currentKline = {
          openTime: tradeTime,
          open: trade.price.toString(),
          high: trade.price.toString(),
          low: trade.price.toString(),
          close: trade.price.toString(),
          volume: trade.amount.toString(),
          closeTime: this.getIntervalCloseTime(tradeTime, interval),
          quoteAssetVolume: (trade.price * trade.amount).toString(),
          trades: 1,
          takerBuyBaseAssetVolume: '0',
          takerBuyQuoteAssetVolume: '0'
        };
      } else {
        currentKline.high = Math.max(parseFloat(currentKline.high), trade.price).toString();
        currentKline.low = Math.min(parseFloat(currentKline.low), trade.price).toString();
        currentKline.close = trade.price.toString();
        currentKline.volume = (parseFloat(currentKline.volume) + trade.amount).toString();
        currentKline.quoteAssetVolume = (parseFloat(currentKline.quoteAssetVolume) + trade.price * trade.amount).toString();
        currentKline.trades += 1;
      }
    }

    if (currentKline) {
      klines.push(currentKline);
    }

    return klines;
  }

  private getIntervalCloseTime(openTime: number, interval: string): number {
    const duration = this.getIntervalDuration(interval);
    return openTime + duration;
  }

  private getIntervalDuration(interval: string): number {
    const unit = interval.slice(-1);
    const value = parseInt(interval.slice(0, -1));
    
    switch (unit) {
      case 'm': return value * 60 * 1000;
      case 'h': return value * 60 * 60 * 1000;
      case 'd': return value * 24 * 60 * 60 * 1000;
      case 'w': return value * 7 * 24 * 60 * 60 * 1000;
      default: return 60 * 60 * 1000; // Default to 1h
    }
  }

  private startTickerUpdates(): void {
    setInterval(async () => {
      for (const symbol of this.tickerCache.keys()) {
        const ticker = await this.calculateTicker(symbol);
        this.tickerCache.set(symbol, ticker);
      }
    }, 1000); // Update every second
  }
}
