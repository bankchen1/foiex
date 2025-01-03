import 'package:freezed_annotation/freezed_annotation.dart';

part 'strategy_models.freezed.dart';
part 'strategy_models.g.dart';

@freezed
class Strategy with _$Strategy {
  const factory Strategy({
    required String id,
    required String name,
    required String description,
    required double totalReturn,
    required double monthlyReturn,
    required double sharpeRatio,
    required double maxDrawdown,
    required int followersCount,
    required List<String> tradingPairs,
    required List<TradeHistory> recentTrades,
    @Default(false) bool isFollowing,
    String? creatorId,
    String? creatorName,
    DateTime? createdAt,
  }) = _Strategy;

  factory Strategy.fromJson(Map<String, dynamic> json) =>
      _$StrategyFromJson(json);
}

@freezed
class TradeHistory with _$TradeHistory {
  const factory TradeHistory({
    required String id,
    required String symbol,
    required String type,
    required double entryPrice,
    required double exitPrice,
    required double profit,
    required double profitPercent,
    required DateTime entryTime,
    required DateTime exitTime,
  }) = _TradeHistory;

  factory TradeHistory.fromJson(Map<String, dynamic> json) =>
      _$TradeHistoryFromJson(json);
}

@freezed
class StrategyPerformance with _$StrategyPerformance {
  const factory StrategyPerformance({
    required String strategyId,
    required List<PerformancePoint> points,
    required double totalReturn,
    required double monthlyReturn,
    required double sharpeRatio,
    required double maxDrawdown,
    required int winRate,
    required int totalTrades,
  }) = _StrategyPerformance;

  factory StrategyPerformance.fromJson(Map<String, dynamic> json) =>
      _$StrategyPerformanceFromJson(json);
}

@freezed
class PerformancePoint with _$PerformancePoint {
  const factory PerformancePoint({
    required DateTime timestamp,
    required double value,
  }) = _PerformancePoint;

  factory PerformancePoint.fromJson(Map<String, dynamic> json) =>
      _$PerformancePointFromJson(json);
}
