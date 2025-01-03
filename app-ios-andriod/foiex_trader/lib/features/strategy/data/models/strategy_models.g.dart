// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategy_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrategyImpl _$$StrategyImplFromJson(Map<String, dynamic> json) =>
    _$StrategyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      totalReturn: (json['totalReturn'] as num).toDouble(),
      monthlyReturn: (json['monthlyReturn'] as num).toDouble(),
      sharpeRatio: (json['sharpeRatio'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      followersCount: (json['followersCount'] as num).toInt(),
      tradingPairs: (json['tradingPairs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      recentTrades: (json['recentTrades'] as List<dynamic>)
          .map((e) => TradeHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFollowing: json['isFollowing'] as bool? ?? false,
      creatorId: json['creatorId'] as String?,
      creatorName: json['creatorName'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$StrategyImplToJson(_$StrategyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'totalReturn': instance.totalReturn,
      'monthlyReturn': instance.monthlyReturn,
      'sharpeRatio': instance.sharpeRatio,
      'maxDrawdown': instance.maxDrawdown,
      'followersCount': instance.followersCount,
      'tradingPairs': instance.tradingPairs,
      'recentTrades': instance.recentTrades.map((e) => e.toJson()).toList(),
      'isFollowing': instance.isFollowing,
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$TradeHistoryImpl _$$TradeHistoryImplFromJson(Map<String, dynamic> json) =>
    _$TradeHistoryImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      entryPrice: (json['entryPrice'] as num).toDouble(),
      exitPrice: (json['exitPrice'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      entryTime: DateTime.parse(json['entryTime'] as String),
      exitTime: DateTime.parse(json['exitTime'] as String),
    );

Map<String, dynamic> _$$TradeHistoryImplToJson(_$TradeHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'type': instance.type,
      'entryPrice': instance.entryPrice,
      'exitPrice': instance.exitPrice,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'entryTime': instance.entryTime.toIso8601String(),
      'exitTime': instance.exitTime.toIso8601String(),
    };

_$StrategyPerformanceImpl _$$StrategyPerformanceImplFromJson(
        Map<String, dynamic> json) =>
    _$StrategyPerformanceImpl(
      strategyId: json['strategyId'] as String,
      points: (json['points'] as List<dynamic>)
          .map((e) => PerformancePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalReturn: (json['totalReturn'] as num).toDouble(),
      monthlyReturn: (json['monthlyReturn'] as num).toDouble(),
      sharpeRatio: (json['sharpeRatio'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      winRate: (json['winRate'] as num).toInt(),
      totalTrades: (json['totalTrades'] as num).toInt(),
    );

Map<String, dynamic> _$$StrategyPerformanceImplToJson(
        _$StrategyPerformanceImpl instance) =>
    <String, dynamic>{
      'strategyId': instance.strategyId,
      'points': instance.points.map((e) => e.toJson()).toList(),
      'totalReturn': instance.totalReturn,
      'monthlyReturn': instance.monthlyReturn,
      'sharpeRatio': instance.sharpeRatio,
      'maxDrawdown': instance.maxDrawdown,
      'winRate': instance.winRate,
      'totalTrades': instance.totalTrades,
    };

_$PerformancePointImpl _$$PerformancePointImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformancePointImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$PerformancePointImplToJson(
        _$PerformancePointImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'value': instance.value,
    };
