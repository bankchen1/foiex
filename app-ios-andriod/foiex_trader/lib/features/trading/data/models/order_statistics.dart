import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_statistics.freezed.dart';
part 'order_statistics.g.dart';

@freezed
class OrderStatistics with _$OrderStatistics {
  const factory OrderStatistics({
    required double winRate,
    required double profitLossRatio,
    required double maxProfit,
    required double maxLoss,
    required double totalProfit,
    required double averageProfit,
    required double averageLoss,
    required int totalTrades,
    required int winTrades,
    required int lossTrades,
    required double profitFactor,
    required double sharpeRatio,
    required double maxDrawdown,
    required double averageHoldingTime,
    required double bestWinStreak,
    required double worstLossStreak,
  }) = _OrderStatistics;

  factory OrderStatistics.fromJson(Map<String, dynamic> json) =>
      _$OrderStatisticsFromJson(json);
}

@freezed
class TimeRangeStatistics with _$TimeRangeStatistics {
  const factory TimeRangeStatistics({
    required DateTime startTime,
    required DateTime endTime,
    required OrderStatistics statistics,
    required List<DailyStatistics> dailyStats,
  }) = _TimeRangeStatistics;

  factory TimeRangeStatistics.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeStatisticsFromJson(json);
}

@freezed
class DailyStatistics with _$DailyStatistics {
  const factory DailyStatistics({
    required DateTime date,
    required double profit,
    required double profitPercent,
    required int trades,
    required int winTrades,
    required double winRate,
  }) = _DailyStatistics;

  factory DailyStatistics.fromJson(Map<String, dynamic> json) =>
      _$DailyStatisticsFromJson(json);
}
