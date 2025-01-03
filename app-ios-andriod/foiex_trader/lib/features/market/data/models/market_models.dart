import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_models.freezed.dart';
part 'market_models.g.dart';

@freezed
class MarketTicker with _$MarketTicker {
  const factory MarketTicker({
    required String symbol,
    required double lastPrice,
    required double high24h,
    required double low24h,
    required double volume24h,
    required double priceChangePercent,
    String? marketType,
  }) = _MarketTicker;

  factory MarketTicker.fromJson(Map<String, dynamic> json) =>
      _$MarketTickerFromJson(json);
}

@freezed
class MarketDepth with _$MarketDepth {
  const factory MarketDepth({
    required String symbol,
    required List<List<double>> bids,
    required List<List<double>> asks,
  }) = _MarketDepth;

  factory MarketDepth.fromJson(Map<String, dynamic> json) =>
      _$MarketDepthFromJson(json);
}

@freezed
class Kline with _$Kline {
  const factory Kline({
    required int timestamp,
    required double open,
    required double high,
    required double low,
    required double close,
    required double volume,
  }) = _Kline;

  factory Kline.fromJson(Map<String, dynamic> json) => _$KlineFromJson(json);
}
