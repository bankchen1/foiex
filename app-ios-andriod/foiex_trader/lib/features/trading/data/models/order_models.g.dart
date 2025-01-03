// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      side: json['side'] as String,
      openPrice: (json['openPrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      openTime: DateTime.parse(json['openTime'] as String),
      status: json['status'] as String,
      stopLoss: (json['stopLoss'] as num?)?.toDouble(),
      takeProfit: (json['takeProfit'] as num?)?.toDouble(),
      followId: json['followId'] as String?,
      strategyId: json['strategyId'] as String?,
      closeTime: json['closeTime'] == null
          ? null
          : DateTime.parse(json['closeTime'] as String),
      profitHistory: (json['profitHistory'] as List<dynamic>)
          .map((e) => ProfitPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => OrderAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'type': instance.type,
      'side': instance.side,
      'openPrice': instance.openPrice,
      'currentPrice': instance.currentPrice,
      'quantity': instance.quantity,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'openTime': instance.openTime.toIso8601String(),
      'status': instance.status,
      'stopLoss': instance.stopLoss,
      'takeProfit': instance.takeProfit,
      'followId': instance.followId,
      'strategyId': instance.strategyId,
      'closeTime': instance.closeTime?.toIso8601String(),
      'profitHistory': instance.profitHistory.map((e) => e.toJson()).toList(),
      'actions': instance.actions.map((e) => e.toJson()).toList(),
    };

_$OrderHistoryImpl _$$OrderHistoryImplFromJson(Map<String, dynamic> json) =>
    _$OrderHistoryImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      type: json['type'] as String,
      side: json['side'] as String,
      openPrice: (json['openPrice'] as num).toDouble(),
      closePrice: (json['closePrice'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      openTime: DateTime.parse(json['openTime'] as String),
      closeTime: DateTime.parse(json['closeTime'] as String),
      followId: json['followId'] as String?,
      strategyId: json['strategyId'] as String?,
    );

Map<String, dynamic> _$$OrderHistoryImplToJson(_$OrderHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'type': instance.type,
      'side': instance.side,
      'openPrice': instance.openPrice,
      'closePrice': instance.closePrice,
      'quantity': instance.quantity,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'openTime': instance.openTime.toIso8601String(),
      'closeTime': instance.closeTime.toIso8601String(),
      'followId': instance.followId,
      'strategyId': instance.strategyId,
    };

_$ModifyOrderRequestImpl _$$ModifyOrderRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ModifyOrderRequestImpl(
      stopLoss: (json['stopLoss'] as num?)?.toDouble(),
      takeProfit: (json['takeProfit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ModifyOrderRequestImplToJson(
        _$ModifyOrderRequestImpl instance) =>
    <String, dynamic>{
      'stopLoss': instance.stopLoss,
      'takeProfit': instance.takeProfit,
    };

_$ProfitPointImpl _$$ProfitPointImplFromJson(Map<String, dynamic> json) =>
    _$ProfitPointImpl(
      timestamp: DateTime.parse(json['timestamp'] as String),
      price: (json['price'] as num).toDouble(),
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProfitPointImplToJson(_$ProfitPointImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'price': instance.price,
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
    };

_$OrderActionImpl _$$OrderActionImplFromJson(Map<String, dynamic> json) =>
    _$OrderActionImpl(
      type: json['type'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      data: json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$OrderActionImplToJson(_$OrderActionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'timestamp': instance.timestamp.toIso8601String(),
      'data': instance.data,
    };
