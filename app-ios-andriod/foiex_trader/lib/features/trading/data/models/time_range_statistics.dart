import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_range_statistics.freezed.dart';
part 'time_range_statistics.g.dart';

@freezed
class TimeRangeStatistics with _$TimeRangeStatistics {
  const factory TimeRangeStatistics({
    required int totalTrades,
    required int winningTrades,
    required int losingTrades,
    required double winRate,
    required double averageWin,
    required double averageLoss,
    required double profitLossRatio,
    required double sharpeRatio,
    required double maxDrawdown,
    required double maxDrawdownPercent,
    required double recoveryFactor,
    required List<DailyStats> dailyStats,
  }) = _TimeRangeStatistics;

  factory TimeRangeStatistics.fromJson(Map<String, dynamic> json) =>
      _$TimeRangeStatisticsFromJson(json);
}

@freezed
class DailyStats with _$DailyStats {
  const factory DailyStats({
    required DateTime date,
    required double profit,
    required int trades,
    required double winRate,
  }) = _DailyStats;

  factory DailyStats.fromJson(Map<String, dynamic> json) =>
      _$DailyStatsFromJson(json);
}
