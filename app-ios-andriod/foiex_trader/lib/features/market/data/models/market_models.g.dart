// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketTickerImpl _$$MarketTickerImplFromJson(Map<String, dynamic> json) =>
    _$MarketTickerImpl(
      symbol: json['symbol'] as String,
      lastPrice: (json['lastPrice'] as num).toDouble(),
      high24h: (json['high24h'] as num).toDouble(),
      low24h: (json['low24h'] as num).toDouble(),
      volume24h: (json['volume24h'] as num).toDouble(),
      priceChangePercent: (json['priceChangePercent'] as num).toDouble(),
      marketType: json['marketType'] as String?,
    );

Map<String, dynamic> _$$MarketTickerImplToJson(_$MarketTickerImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'lastPrice': instance.lastPrice,
      'high24h': instance.high24h,
      'low24h': instance.low24h,
      'volume24h': instance.volume24h,
      'priceChangePercent': instance.priceChangePercent,
      'marketType': instance.marketType,
    };

_$MarketDepthImpl _$$MarketDepthImplFromJson(Map<String, dynamic> json) =>
    _$MarketDepthImpl(
      symbol: json['symbol'] as String,
      bids: (json['bids'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      asks: (json['asks'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$MarketDepthImplToJson(_$MarketDepthImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'bids': instance.bids,
      'asks': instance.asks,
    };

_$KlineImpl _$$KlineImplFromJson(Map<String, dynamic> json) => _$KlineImpl(
      timestamp: (json['timestamp'] as num).toInt(),
      open: (json['open'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      close: (json['close'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
    );

Map<String, dynamic> _$$KlineImplToJson(_$KlineImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
    };
