import { ApiProperty } from '@nestjs/swagger';

export class TickerDto {
  @ApiProperty({ description: '交易对' })
  symbol: string;

  @ApiProperty({ description: '价格变化' })
  priceChange: string;

  @ApiProperty({ description: '价格变化百分比' })
  priceChangePercent: string;

  @ApiProperty({ description: '加权平均价格' })
  weightedAvgPrice: string;

  @ApiProperty({ description: '前收盘价' })
  prevClosePrice: string;

  @ApiProperty({ description: '最新价格' })
  lastPrice: string;

  @ApiProperty({ description: '最新成交量' })
  lastQty: string;

  @ApiProperty({ description: '买一价' })
  bidPrice: string;

  @ApiProperty({ description: '卖一价' })
  askPrice: string;

  @ApiProperty({ description: '开盘价' })
  openPrice: string;

  @ApiProperty({ description: '最高价' })
  highPrice: string;

  @ApiProperty({ description: '最低价' })
  lowPrice: string;

  @ApiProperty({ description: '成交量' })
  volume: string;

  @ApiProperty({ description: '成交额' })
  quoteVolume: string;

  @ApiProperty({ description: '开盘时间' })
  openTime: number;

  @ApiProperty({ description: '收盘时间' })
  closeTime: number;

  @ApiProperty({ description: '第一笔成交ID' })
  firstId: number;

  @ApiProperty({ description: '最后一笔成交ID' })
  lastId: number;

  @ApiProperty({ description: '成交笔数' })
  count: number;
}

export class OrderBookEntryDto {
  @ApiProperty({ description: '价格' })
  price: string;

  @ApiProperty({ description: '数量' })
  quantity: string;
}

export class OrderBookDto {
  @ApiProperty({ description: '最后更新ID' })
  lastUpdateId: number;

  @ApiProperty({ description: '买单列表', type: [OrderBookEntryDto] })
  bids: OrderBookEntryDto[];

  @ApiProperty({ description: '卖单列表', type: [OrderBookEntryDto] })
  asks: OrderBookEntryDto[];
}

export class KlineDto {
  @ApiProperty({ description: '开盘时间' })
  openTime: number;

  @ApiProperty({ description: '开盘价' })
  open: string;

  @ApiProperty({ description: '最高价' })
  high: string;

  @ApiProperty({ description: '最低价' })
  low: string;

  @ApiProperty({ description: '收盘价' })
  close: string;

  @ApiProperty({ description: '成交量' })
  volume: string;

  @ApiProperty({ description: '收盘时间' })
  closeTime: number;

  @ApiProperty({ description: '成交额' })
  quoteAssetVolume: string;

  @ApiProperty({ description: '成交笔数' })
  trades: number;

  @ApiProperty({ description: '主动买入成交量' })
  takerBuyBaseAssetVolume: string;

  @ApiProperty({ description: '主动买入成交额' })
  takerBuyQuoteAssetVolume: string;
}
