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
      stopLoss: (json['stopLoss'] as num?)?.toDouble(),
      takeProfit: (json['takeProfit'] as num?)?.toDouble(),
      followId: json['followId'] as String?,
      strategyId: json['strategyId'] as String?,
      status: json['status'] as String?,
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
      'stopLoss': instance.stopLoss,
      'takeProfit': instance.takeProfit,
      'followId': instance.followId,
      'strategyId': instance.strategyId,
      'status': instance.status,
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
