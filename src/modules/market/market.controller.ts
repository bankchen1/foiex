import { Controller, Get, Query } from '@nestjs/common';
import { MarketService } from './market.service';
import { ApiTags, ApiOperation, ApiResponse } from '@nestjs/swagger';
import { TickerDto, OrderBookDto, KlineDto } from './dto/market.dto';

@ApiTags('market')
@Controller('market')
export class MarketController {
  constructor(private readonly marketService: MarketService) {}

  @Get('ticker')
  @ApiOperation({ summary: '获取单个交易对行情' })
  @ApiResponse({
    status: 200,
    description: '返回交易对行情数据',
    type: TickerDto,
  })
  async getTicker(@Query('symbol') symbol: string = 'BTC/USDT'): Promise<TickerDto> {
    return this.marketService.getTicker(symbol);
  }

  @Get('tickers')
  @ApiOperation({ summary: '获取所有交易对行情' })
  @ApiResponse({
    status: 200,
    description: '返回所有交易对行情数据',
    type: [TickerDto],
  })
  async getTickers(): Promise<TickerDto[]> {
    // Get the default symbol if no other symbols are available
    const defaultSymbol = 'BTC/USDT';
    const ticker = await this.marketService.getTicker(defaultSymbol);
    return [ticker];
  }

  @Get('depth')
  @ApiOperation({ summary: '获取交易对深度信息' })
  @ApiResponse({
    status: 200,
    description: '返回交易对深度数据',
    type: OrderBookDto,
  })
  async getDepth(
    @Query('symbol') symbol: string = 'BTC/USDT',
    @Query('limit') limit: number = 100,
  ): Promise<OrderBookDto> {
    return this.marketService.getOrderBook(symbol, limit);
  }

  @Get('klines')
  @ApiOperation({ summary: '获取K线数据' })
  @ApiResponse({
    status: 200,
    description: '返回K线数据',
    type: [KlineDto],
  })
  async getKlines(
    @Query('symbol') symbol: string = 'BTC/USDT',
    @Query('interval') interval: string = '1h',
    @Query('limit') limit: number = 100,
  ): Promise<KlineDto[]> {
    return this.marketService.getKlines(symbol, interval, limit);
  }
}