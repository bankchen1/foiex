// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get side => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  DateTime get openTime => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double? get stopLoss => throw _privateConstructorUsedError;
  double? get takeProfit => throw _privateConstructorUsedError;
  String? get followId => throw _privateConstructorUsedError;
  String? get strategyId => throw _privateConstructorUsedError;
  DateTime? get closeTime => throw _privateConstructorUsedError;
  List<ProfitPoint> get profitHistory => throw _privateConstructorUsedError;
  List<OrderAction> get actions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String type,
      String side,
      double openPrice,
      double currentPrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      String status,
      double? stopLoss,
      double? takeProfit,
      String? followId,
      String? strategyId,
      DateTime? closeTime,
      List<ProfitPoint> profitHistory,
      List<OrderAction> actions});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? type = null,
    Object? side = null,
    Object? openPrice = null,
    Object? currentPrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? status = null,
    Object? stopLoss = freezed,
    Object? takeProfit = freezed,
    Object? followId = freezed,
    Object? strategyId = freezed,
    Object? closeTime = freezed,
    Object? profitHistory = null,
    Object? actions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      stopLoss: freezed == stopLoss
          ? _value.stopLoss
          : stopLoss // ignore: cast_nullable_to_non_nullable
              as double?,
      takeProfit: freezed == takeProfit
          ? _value.takeProfit
          : takeProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      followId: freezed == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String?,
      strategyId: freezed == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profitHistory: null == profitHistory
          ? _value.profitHistory
          : profitHistory // ignore: cast_nullable_to_non_nullable
              as List<ProfitPoint>,
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<OrderAction>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String type,
      String side,
      double openPrice,
      double currentPrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      String status,
      double? stopLoss,
      double? takeProfit,
      String? followId,
      String? strategyId,
      DateTime? closeTime,
      List<ProfitPoint> profitHistory,
      List<OrderAction> actions});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? type = null,
    Object? side = null,
    Object? openPrice = null,
    Object? currentPrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? status = null,
    Object? stopLoss = freezed,
    Object? takeProfit = freezed,
    Object? followId = freezed,
    Object? strategyId = freezed,
    Object? closeTime = freezed,
    Object? profitHistory = null,
    Object? actions = null,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      stopLoss: freezed == stopLoss
          ? _value.stopLoss
          : stopLoss // ignore: cast_nullable_to_non_nullable
              as double?,
      takeProfit: freezed == takeProfit
          ? _value.takeProfit
          : takeProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      followId: freezed == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String?,
      strategyId: freezed == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String?,
      closeTime: freezed == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      profitHistory: null == profitHistory
          ? _value._profitHistory
          : profitHistory // ignore: cast_nullable_to_non_nullable
              as List<ProfitPoint>,
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<OrderAction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.symbol,
      required this.type,
      required this.side,
      required this.openPrice,
      required this.currentPrice,
      required this.quantity,
      required this.profit,
      required this.profitPercent,
      required this.openTime,
      required this.status,
      this.stopLoss,
      this.takeProfit,
      this.followId,
      this.strategyId,
      this.closeTime,
      required final List<ProfitPoint> profitHistory,
      required final List<OrderAction> actions})
      : _profitHistory = profitHistory,
        _actions = actions;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String type;
  @override
  final String side;
  @override
  final double openPrice;
  @override
  final double currentPrice;
  @override
  final double quantity;
  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final DateTime openTime;
  @override
  final String status;
  @override
  final double? stopLoss;
  @override
  final double? takeProfit;
  @override
  final String? followId;
  @override
  final String? strategyId;
  @override
  final DateTime? closeTime;
  final List<ProfitPoint> _profitHistory;
  @override
  List<ProfitPoint> get profitHistory {
    if (_profitHistory is EqualUnmodifiableListView) return _profitHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_profitHistory);
  }

  final List<OrderAction> _actions;
  @override
  List<OrderAction> get actions {
    if (_actions is EqualUnmodifiableListView) return _actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actions);
  }

  @override
  String toString() {
    return 'Order(id: $id, symbol: $symbol, type: $type, side: $side, openPrice: $openPrice, currentPrice: $currentPrice, quantity: $quantity, profit: $profit, profitPercent: $profitPercent, openTime: $openTime, status: $status, stopLoss: $stopLoss, takeProfit: $takeProfit, followId: $followId, strategyId: $strategyId, closeTime: $closeTime, profitHistory: $profitHistory, actions: $actions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.stopLoss, stopLoss) ||
                other.stopLoss == stopLoss) &&
            (identical(other.takeProfit, takeProfit) ||
                other.takeProfit == takeProfit) &&
            (identical(other.followId, followId) ||
                other.followId == followId) &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            const DeepCollectionEquality()
                .equals(other._profitHistory, _profitHistory) &&
            const DeepCollectionEquality().equals(other._actions, _actions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      symbol,
      type,
      side,
      openPrice,
      currentPrice,
      quantity,
      profit,
      profitPercent,
      openTime,
      status,
      stopLoss,
      takeProfit,
      followId,
      strategyId,
      closeTime,
      const DeepCollectionEquality().hash(_profitHistory),
      const DeepCollectionEquality().hash(_actions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String symbol,
      required final String type,
      required final String side,
      required final double openPrice,
      required final double currentPrice,
      required final double quantity,
      required final double profit,
      required final double profitPercent,
      required final DateTime openTime,
      required final String status,
      final double? stopLoss,
      final double? takeProfit,
      final String? followId,
      final String? strategyId,
      final DateTime? closeTime,
      required final List<ProfitPoint> profitHistory,
      required final List<OrderAction> actions}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get type;
  @override
  String get side;
  @override
  double get openPrice;
  @override
  double get currentPrice;
  @override
  double get quantity;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  DateTime get openTime;
  @override
  String get status;
  @override
  double? get stopLoss;
  @override
  double? get takeProfit;
  @override
  String? get followId;
  @override
  String? get strategyId;
  @override
  DateTime? get closeTime;
  @override
  List<ProfitPoint> get profitHistory;
  @override
  List<OrderAction> get actions;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return _OrderHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderHistory {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get side => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double get closePrice => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  DateTime get openTime => throw _privateConstructorUsedError;
  DateTime get closeTime => throw _privateConstructorUsedError;
  String? get followId => throw _privateConstructorUsedError;
  String? get strategyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String type,
      String side,
      double openPrice,
      double closePrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      DateTime closeTime,
      String? followId,
      String? strategyId});
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? type = null,
    Object? side = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? followId = freezed,
    Object? strategyId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      followId: freezed == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String?,
      strategyId: freezed == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryImplCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$OrderHistoryImplCopyWith(
          _$OrderHistoryImpl value, $Res Function(_$OrderHistoryImpl) then) =
      __$$OrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String type,
      String side,
      double openPrice,
      double closePrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      DateTime closeTime,
      String? followId,
      String? strategyId});
}

/// @nodoc
class __$$OrderHistoryImplCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$OrderHistoryImpl>
    implements _$$OrderHistoryImplCopyWith<$Res> {
  __$$OrderHistoryImplCopyWithImpl(
      _$OrderHistoryImpl _value, $Res Function(_$OrderHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? type = null,
    Object? side = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? followId = freezed,
    Object? strategyId = freezed,
  }) {
    return _then(_$OrderHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      side: null == side
          ? _value.side
          : side // ignore: cast_nullable_to_non_nullable
              as String,
      openPrice: null == openPrice
          ? _value.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      closePrice: null == closePrice
          ? _value.closePrice
          : closePrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      followId: freezed == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String?,
      strategyId: freezed == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderHistoryImpl implements _OrderHistory {
  const _$OrderHistoryImpl(
      {required this.id,
      required this.symbol,
      required this.type,
      required this.side,
      required this.openPrice,
      required this.closePrice,
      required this.quantity,
      required this.profit,
      required this.profitPercent,
      required this.openTime,
      required this.closeTime,
      this.followId,
      this.strategyId});

  factory _$OrderHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String type;
  @override
  final String side;
  @override
  final double openPrice;
  @override
  final double closePrice;
  @override
  final double quantity;
  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final DateTime openTime;
  @override
  final DateTime closeTime;
  @override
  final String? followId;
  @override
  final String? strategyId;

  @override
  String toString() {
    return 'OrderHistory(id: $id, symbol: $symbol, type: $type, side: $side, openPrice: $openPrice, closePrice: $closePrice, quantity: $quantity, profit: $profit, profitPercent: $profitPercent, openTime: $openTime, closeTime: $closeTime, followId: $followId, strategyId: $strategyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.side, side) || other.side == side) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.closePrice, closePrice) ||
                other.closePrice == closePrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.followId, followId) ||
                other.followId == followId) &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      symbol,
      type,
      side,
      openPrice,
      closePrice,
      quantity,
      profit,
      profitPercent,
      openTime,
      closeTime,
      followId,
      strategyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      __$$OrderHistoryImplCopyWithImpl<_$OrderHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderHistoryImplToJson(
      this,
    );
  }
}

abstract class _OrderHistory implements OrderHistory {
  const factory _OrderHistory(
      {required final String id,
      required final String symbol,
      required final String type,
      required final String side,
      required final double openPrice,
      required final double closePrice,
      required final double quantity,
      required final double profit,
      required final double profitPercent,
      required final DateTime openTime,
      required final DateTime closeTime,
      final String? followId,
      final String? strategyId}) = _$OrderHistoryImpl;

  factory _OrderHistory.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get type;
  @override
  String get side;
  @override
  double get openPrice;
  @override
  double get closePrice;
  @override
  double get quantity;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  DateTime get openTime;
  @override
  DateTime get closeTime;
  @override
  String? get followId;
  @override
  String? get strategyId;
  @override
  @JsonKey(ignore: true)
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ModifyOrderRequest _$ModifyOrderRequestFromJson(Map<String, dynamic> json) {
  return _ModifyOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$ModifyOrderRequest {
  double? get stopLoss => throw _privateConstructorUsedError;
  double? get takeProfit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModifyOrderRequestCopyWith<ModifyOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModifyOrderRequestCopyWith<$Res> {
  factory $ModifyOrderRequestCopyWith(
          ModifyOrderRequest value, $Res Function(ModifyOrderRequest) then) =
      _$ModifyOrderRequestCopyWithImpl<$Res, ModifyOrderRequest>;
  @useResult
  $Res call({double? stopLoss, double? takeProfit});
}

/// @nodoc
class _$ModifyOrderRequestCopyWithImpl<$Res, $Val extends ModifyOrderRequest>
    implements $ModifyOrderRequestCopyWith<$Res> {
  _$ModifyOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopLoss = freezed,
    Object? takeProfit = freezed,
  }) {
    return _then(_value.copyWith(
      stopLoss: freezed == stopLoss
          ? _value.stopLoss
          : stopLoss // ignore: cast_nullable_to_non_nullable
              as double?,
      takeProfit: freezed == takeProfit
          ? _value.takeProfit
          : takeProfit // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ModifyOrderRequestImplCopyWith<$Res>
    implements $ModifyOrderRequestCopyWith<$Res> {
  factory _$$ModifyOrderRequestImplCopyWith(_$ModifyOrderRequestImpl value,
          $Res Function(_$ModifyOrderRequestImpl) then) =
      __$$ModifyOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? stopLoss, double? takeProfit});
}

/// @nodoc
class __$$ModifyOrderRequestImplCopyWithImpl<$Res>
    extends _$ModifyOrderRequestCopyWithImpl<$Res, _$ModifyOrderRequestImpl>
    implements _$$ModifyOrderRequestImplCopyWith<$Res> {
  __$$ModifyOrderRequestImplCopyWithImpl(_$ModifyOrderRequestImpl _value,
      $Res Function(_$ModifyOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stopLoss = freezed,
    Object? takeProfit = freezed,
  }) {
    return _then(_$ModifyOrderRequestImpl(
      stopLoss: freezed == stopLoss
          ? _value.stopLoss
          : stopLoss // ignore: cast_nullable_to_non_nullable
              as double?,
      takeProfit: freezed == takeProfit
          ? _value.takeProfit
          : takeProfit // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ModifyOrderRequestImpl implements _ModifyOrderRequest {
  const _$ModifyOrderRequestImpl({this.stopLoss, this.takeProfit});

  factory _$ModifyOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ModifyOrderRequestImplFromJson(json);

  @override
  final double? stopLoss;
  @override
  final double? takeProfit;

  @override
  String toString() {
    return 'ModifyOrderRequest(stopLoss: $stopLoss, takeProfit: $takeProfit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ModifyOrderRequestImpl &&
            (identical(other.stopLoss, stopLoss) ||
                other.stopLoss == stopLoss) &&
            (identical(other.takeProfit, takeProfit) ||
                other.takeProfit == takeProfit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stopLoss, takeProfit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ModifyOrderRequestImplCopyWith<_$ModifyOrderRequestImpl> get copyWith =>
      __$$ModifyOrderRequestImplCopyWithImpl<_$ModifyOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ModifyOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _ModifyOrderRequest implements ModifyOrderRequest {
  const factory _ModifyOrderRequest(
      {final double? stopLoss,
      final double? takeProfit}) = _$ModifyOrderRequestImpl;

  factory _ModifyOrderRequest.fromJson(Map<String, dynamic> json) =
      _$ModifyOrderRequestImpl.fromJson;

  @override
  double? get stopLoss;
  @override
  double? get takeProfit;
  @override
  @JsonKey(ignore: true)
  _$$ModifyOrderRequestImplCopyWith<_$ModifyOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfitPoint _$ProfitPointFromJson(Map<String, dynamic> json) {
  return _ProfitPoint.fromJson(json);
}

/// @nodoc
mixin _$ProfitPoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfitPointCopyWith<ProfitPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitPointCopyWith<$Res> {
  factory $ProfitPointCopyWith(
          ProfitPoint value, $Res Function(ProfitPoint) then) =
      _$ProfitPointCopyWithImpl<$Res, ProfitPoint>;
  @useResult
  $Res call(
      {DateTime timestamp, double price, double profit, double profitPercent});
}

/// @nodoc
class _$ProfitPointCopyWithImpl<$Res, $Val extends ProfitPoint>
    implements $ProfitPointCopyWith<$Res> {
  _$ProfitPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
    Object? profit = null,
    Object? profitPercent = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitPointImplCopyWith<$Res>
    implements $ProfitPointCopyWith<$Res> {
  factory _$$ProfitPointImplCopyWith(
          _$ProfitPointImpl value, $Res Function(_$ProfitPointImpl) then) =
      __$$ProfitPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp, double price, double profit, double profitPercent});
}

/// @nodoc
class __$$ProfitPointImplCopyWithImpl<$Res>
    extends _$ProfitPointCopyWithImpl<$Res, _$ProfitPointImpl>
    implements _$$ProfitPointImplCopyWith<$Res> {
  __$$ProfitPointImplCopyWithImpl(
      _$ProfitPointImpl _value, $Res Function(_$ProfitPointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? price = null,
    Object? profit = null,
    Object? profitPercent = null,
  }) {
    return _then(_$ProfitPointImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfitPointImpl implements _ProfitPoint {
  const _$ProfitPointImpl(
      {required this.timestamp,
      required this.price,
      required this.profit,
      required this.profitPercent});

  factory _$ProfitPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfitPointImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double price;
  @override
  final double profit;
  @override
  final double profitPercent;

  @override
  String toString() {
    return 'ProfitPoint(timestamp: $timestamp, price: $price, profit: $profit, profitPercent: $profitPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitPointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, price, profit, profitPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitPointImplCopyWith<_$ProfitPointImpl> get copyWith =>
      __$$ProfitPointImplCopyWithImpl<_$ProfitPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfitPointImplToJson(
      this,
    );
  }
}

abstract class _ProfitPoint implements ProfitPoint {
  const factory _ProfitPoint(
      {required final DateTime timestamp,
      required final double price,
      required final double profit,
      required final double profitPercent}) = _$ProfitPointImpl;

  factory _ProfitPoint.fromJson(Map<String, dynamic> json) =
      _$ProfitPointImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get price;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  @JsonKey(ignore: true)
  _$$ProfitPointImplCopyWith<_$ProfitPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderAction _$OrderActionFromJson(Map<String, dynamic> json) {
  return _OrderAction.fromJson(json);
}

/// @nodoc
mixin _$OrderAction {
  String get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderActionCopyWith<OrderAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderActionCopyWith<$Res> {
  factory $OrderActionCopyWith(
          OrderAction value, $Res Function(OrderAction) then) =
      _$OrderActionCopyWithImpl<$Res, OrderAction>;
  @useResult
  $Res call({String type, DateTime timestamp, Map<String, dynamic> data});
}

/// @nodoc
class _$OrderActionCopyWithImpl<$Res, $Val extends OrderAction>
    implements $OrderActionCopyWith<$Res> {
  _$OrderActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderActionImplCopyWith<$Res>
    implements $OrderActionCopyWith<$Res> {
  factory _$$OrderActionImplCopyWith(
          _$OrderActionImpl value, $Res Function(_$OrderActionImpl) then) =
      __$$OrderActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, DateTime timestamp, Map<String, dynamic> data});
}

/// @nodoc
class __$$OrderActionImplCopyWithImpl<$Res>
    extends _$OrderActionCopyWithImpl<$Res, _$OrderActionImpl>
    implements _$$OrderActionImplCopyWith<$Res> {
  __$$OrderActionImplCopyWithImpl(
      _$OrderActionImpl _value, $Res Function(_$OrderActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? timestamp = null,
    Object? data = null,
  }) {
    return _then(_$OrderActionImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderActionImpl implements _OrderAction {
  const _$OrderActionImpl(
      {required this.type,
      required this.timestamp,
      required final Map<String, dynamic> data})
      : _data = data;

  factory _$OrderActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderActionImplFromJson(json);

  @override
  final String type;
  @override
  final DateTime timestamp;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'OrderAction(type: $type, timestamp: $timestamp, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, timestamp, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderActionImplCopyWith<_$OrderActionImpl> get copyWith =>
      __$$OrderActionImplCopyWithImpl<_$OrderActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderActionImplToJson(
      this,
    );
  }
}

abstract class _OrderAction implements OrderAction {
  const factory _OrderAction(
      {required final String type,
      required final DateTime timestamp,
      required final Map<String, dynamic> data}) = _$OrderActionImpl;

  factory _OrderAction.fromJson(Map<String, dynamic> json) =
      _$OrderActionImpl.fromJson;

  @override
  String get type;
  @override
  DateTime get timestamp;
  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$OrderActionImplCopyWith<_$OrderActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
