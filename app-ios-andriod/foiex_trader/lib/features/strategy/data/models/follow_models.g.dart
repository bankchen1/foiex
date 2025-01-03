// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowRequestImpl _$$FollowRequestImplFromJson(Map<String, dynamic> json) =>
    _$FollowRequestImpl(
      strategyId: json['strategyId'] as String,
      allocation: (json['allocation'] as num).toDouble(),
      maxLoss: (json['maxLoss'] as num).toDouble(),
      positionRatio: (json['positionRatio'] as num).toDouble(),
    );

Map<String, dynamic> _$$FollowRequestImplToJson(_$FollowRequestImpl instance) =>
    <String, dynamic>{
      'strategyId': instance.strategyId,
      'allocation': instance.allocation,
      'maxLoss': instance.maxLoss,
      'positionRatio': instance.positionRatio,
    };

_$FollowStatusImpl _$$FollowStatusImplFromJson(Map<String, dynamic> json) =>
    _$FollowStatusImpl(
      id: json['id'] as String,
      strategyId: json['strategyId'] as String,
      status: json['status'] as String,
      allocation: (json['allocation'] as num).toDouble(),
      maxLoss: (json['maxLoss'] as num).toDouble(),
      positionRatio: (json['positionRatio'] as num).toDouble(),
      totalProfit: (json['totalProfit'] as num).toDouble(),
      totalProfitPercent: (json['totalProfitPercent'] as num).toDouble(),
      todayProfit: (json['todayProfit'] as num).toDouble(),
      todayProfitPercent: (json['todayProfitPercent'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      maxDrawdownPercent: (json['maxDrawdownPercent'] as num).toDouble(),
      performanceData: (json['performanceData'] as List<dynamic>)
          .map((e) => PerformanceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      tradeHistory: (json['tradeHistory'] as List<dynamic>)
          .map((e) => TradeHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowStatusImplToJson(_$FollowStatusImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'strategyId': instance.strategyId,
      'status': instance.status,
      'allocation': instance.allocation,
      'maxLoss': instance.maxLoss,
      'positionRatio': instance.positionRatio,
      'totalProfit': instance.totalProfit,
      'totalProfitPercent': instance.totalProfitPercent,
      'todayProfit': instance.todayProfit,
      'todayProfitPercent': instance.todayProfitPercent,
      'maxDrawdown': instance.maxDrawdown,
      'maxDrawdownPercent': instance.maxDrawdownPercent,
      'performanceData': instance.performanceData,
      'tradeHistory': instance.tradeHistory,
    };

_$PerformanceDataImpl _$$PerformanceDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PerformanceDataImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      drawdown: (json['drawdown'] as num).toDouble(),
      drawdownPercent: (json['drawdownPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$PerformanceDataImplToJson(
        _$PerformanceDataImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'drawdown': instance.drawdown,
      'drawdownPercent': instance.drawdownPercent,
    };

_$TradeHistoryImpl _$$TradeHistoryImplFromJson(Map<String, dynamic> json) =>
    _$TradeHistoryImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      side: json['side'] as String,
      openPrice: (json['openPrice'] as num).toDouble(),
      closePrice: (json['closePrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      openTime: DateTime.parse(json['openTime'] as String),
      closeTime: DateTime.parse(json['closeTime'] as String),
    );

Map<String, dynamic> _$$TradeHistoryImplToJson(_$TradeHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'side': instance.side,
      'openPrice': instance.openPrice,
      'closePrice': instance.closePrice,
      'quantity': instance.quantity,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'openTime': instance.openTime.toIso8601String(),
      'closeTime': instance.closeTime.toIso8601String(),
    };

_$FollowStatsImpl _$$FollowStatsImplFromJson(Map<String, dynamic> json) =>
    _$FollowStatsImpl(
      totalTrades: (json['totalTrades'] as num).toInt(),
      winningTrades: (json['winningTrades'] as num).toInt(),
      losingTrades: (json['losingTrades'] as num).toInt(),
      winRate: (json['winRate'] as num).toDouble(),
      averageWin: (json['averageWin'] as num).toDouble(),
      averageLoss: (json['averageLoss'] as num).toDouble(),
      profitFactor: (json['profitFactor'] as num).toDouble(),
      sharpeRatio: (json['sharpeRatio'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      maxDrawdownPercent: (json['maxDrawdownPercent'] as num).toDouble(),
      recoveryFactor: (json['recoveryFactor'] as num).toDouble(),
    );

Map<String, dynamic> _$$FollowStatsImplToJson(_$FollowStatsImpl instance) =>
    <String, dynamic>{
      'totalTrades': instance.totalTrades,
      'winningTrades': instance.winningTrades,
      'losingTrades': instance.losingTrades,
      'winRate': instance.winRate,
      'averageWin': instance.averageWin,
      'averageLoss': instance.averageLoss,
      'profitFactor': instance.profitFactor,
      'sharpeRatio': instance.sharpeRatio,
      'maxDrawdown': instance.maxDrawdown,
      'maxDrawdownPercent': instance.maxDrawdownPercent,
      'recoveryFactor': instance.recoveryFactor,
    };
