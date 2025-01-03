import 'package:freezed_annotation/freezed_annotation.dart';

part 'follow_models.freezed.dart';
part 'follow_models.g.dart';

@freezed
class FollowRequest with _$FollowRequest {
  const factory FollowRequest({
    required String strategyId,
    required double allocation,
    required double maxLoss,
    required double positionRatio,
  }) = _FollowRequest;

  factory FollowRequest.fromJson(Map<String, dynamic> json) =>
      _$FollowRequestFromJson(json);
}

@freezed
class FollowStatus with _$FollowStatus {
  const factory FollowStatus({
    required String id,
    required String strategyId,
    required String status,
    required double allocation,
    required double maxLoss,
    required double positionRatio,
    required double totalProfit,
    required double totalProfitPercent,
    required double todayProfit,
    required double todayProfitPercent,
    required double maxDrawdown,
    required double maxDrawdownPercent,
    required List<PerformanceData> performanceData,
    required List<TradeHistory> tradeHistory,
  }) = _FollowStatus;

  factory FollowStatus.fromJson(Map<String, dynamic> json) =>
      _$FollowStatusFromJson(json);
}

@freezed
class PerformanceData with _$PerformanceData {
  const factory PerformanceData({
    required DateTime timestamp,
    required double profit,
    required double profitPercent,
    required double drawdown,
    required double drawdownPercent,
  }) = _PerformanceData;

  factory PerformanceData.fromJson(Map<String, dynamic> json) =>
      _$PerformanceDataFromJson(json);
}

@freezed
class TradeHistory with _$TradeHistory {
  const factory TradeHistory({
    required String id,
    required String symbol,
    required String side,
    required double openPrice,
    required double closePrice,
    required double quantity,
    required double profit,
    required double profitPercent,
    required DateTime openTime,
    required DateTime closeTime,
  }) = _TradeHistory;

  factory TradeHistory.fromJson(Map<String, dynamic> json) =>
      _$TradeHistoryFromJson(json);
}

@freezed
class FollowStats with _$FollowStats {
  const factory FollowStats({
    required int totalTrades,
    required int winningTrades,
    required int losingTrades,
    required double winRate,
    required double averageWin,
    required double averageLoss,
    required double profitFactor,
    required double sharpeRatio,
    required double maxDrawdown,
    required double maxDrawdownPercent,
    required double recoveryFactor,
  }) = _FollowStats;

  factory FollowStats.fromJson(Map<String, dynamic> json) =>
      _$FollowStatsFromJson(json);
}
