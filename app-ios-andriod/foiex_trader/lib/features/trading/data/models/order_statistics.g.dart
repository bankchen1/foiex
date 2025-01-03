// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStatisticsImpl _$$OrderStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatisticsImpl(
      winRate: (json['winRate'] as num).toDouble(),
      profitLossRatio: (json['profitLossRatio'] as num).toDouble(),
      maxProfit: (json['maxProfit'] as num).toDouble(),
      maxLoss: (json['maxLoss'] as num).toDouble(),
      totalProfit: (json['totalProfit'] as num).toDouble(),
      averageProfit: (json['averageProfit'] as num).toDouble(),
      averageLoss: (json['averageLoss'] as num).toDouble(),
      totalTrades: (json['totalTrades'] as num).toInt(),
      winTrades: (json['winTrades'] as num).toInt(),
      lossTrades: (json['lossTrades'] as num).toInt(),
      profitFactor: (json['profitFactor'] as num).toDouble(),
      sharpeRatio: (json['sharpeRatio'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      averageHoldingTime: (json['averageHoldingTime'] as num).toDouble(),
      bestWinStreak: (json['bestWinStreak'] as num).toDouble(),
      worstLossStreak: (json['worstLossStreak'] as num).toDouble(),
    );

Map<String, dynamic> _$$OrderStatisticsImplToJson(
        _$OrderStatisticsImpl instance) =>
    <String, dynamic>{
      'winRate': instance.winRate,
      'profitLossRatio': instance.profitLossRatio,
      'maxProfit': instance.maxProfit,
      'maxLoss': instance.maxLoss,
      'totalProfit': instance.totalProfit,
      'averageProfit': instance.averageProfit,
      'averageLoss': instance.averageLoss,
      'totalTrades': instance.totalTrades,
      'winTrades': instance.winTrades,
      'lossTrades': instance.lossTrades,
      'profitFactor': instance.profitFactor,
      'sharpeRatio': instance.sharpeRatio,
      'maxDrawdown': instance.maxDrawdown,
      'averageHoldingTime': instance.averageHoldingTime,
      'bestWinStreak': instance.bestWinStreak,
      'worstLossStreak': instance.worstLossStreak,
    };

_$TimeRangeStatisticsImpl _$$TimeRangeStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$TimeRangeStatisticsImpl(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      statistics:
          OrderStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
      dailyStats: (json['dailyStats'] as List<dynamic>)
          .map((e) => DailyStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TimeRangeStatisticsImplToJson(
        _$TimeRangeStatisticsImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'statistics': instance.statistics.toJson(),
      'dailyStats': instance.dailyStats.map((e) => e.toJson()).toList(),
    };

_$DailyStatisticsImpl _$$DailyStatisticsImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyStatisticsImpl(
      date: DateTime.parse(json['date'] as String),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      trades: (json['trades'] as num).toInt(),
      winTrades: (json['winTrades'] as num).toInt(),
      winRate: (json['winRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyStatisticsImplToJson(
        _$DailyStatisticsImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'trades': instance.trades,
      'winTrades': instance.winTrades,
      'winRate': instance.winRate,
    };
