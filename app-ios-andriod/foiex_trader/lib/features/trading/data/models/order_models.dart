import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_models.freezed.dart';
part 'order_models.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String symbol,
    required String type,
    required String side,
    required double openPrice,
    required double currentPrice,
    required double quantity,
    required double profit,
    required double profitPercent,
    required DateTime openTime,
    required String status,
    double? stopLoss,
    double? takeProfit,
    String? followId,
    String? strategyId,
    DateTime? closeTime,
    required List<ProfitPoint> profitHistory,
    required List<OrderAction> actions,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderHistory with _$OrderHistory {
  const factory OrderHistory({
    required String id,
    required String symbol,
    required String type,
    required String side,
    required double openPrice,
    required double closePrice,
    required double quantity,
    required double profit,
    required double profitPercent,
    required DateTime openTime,
    required DateTime closeTime,
    String? followId,
    String? strategyId,
  }) = _OrderHistory;

  factory OrderHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryFromJson(json);
}

@freezed
class ModifyOrderRequest with _$ModifyOrderRequest {
  const factory ModifyOrderRequest({
    double? stopLoss,
    double? takeProfit,
  }) = _ModifyOrderRequest;

  factory ModifyOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$ModifyOrderRequestFromJson(json);
}

@freezed
class ProfitPoint with _$ProfitPoint {
  const factory ProfitPoint({
    required DateTime timestamp,
    required double price,
    required double profit,
    required double profitPercent,
  }) = _ProfitPoint;

  factory ProfitPoint.fromJson(Map<String, dynamic> json) =>
      _$ProfitPointFromJson(json);
}

@freezed
class OrderAction with _$OrderAction {
  const factory OrderAction({
    required String type,
    required DateTime timestamp,
    required Map<String, dynamic> data,
  }) = _OrderAction;

  factory OrderAction.fromJson(Map<String, dynamic> json) =>
      _$OrderActionFromJson(json);
}
