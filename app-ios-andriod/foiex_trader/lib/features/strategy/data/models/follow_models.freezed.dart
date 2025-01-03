// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follow_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) {
  return _FollowRequest.fromJson(json);
}

/// @nodoc
mixin _$FollowRequest {
  String get strategyId => throw _privateConstructorUsedError;
  double get allocation => throw _privateConstructorUsedError;
  double get maxLoss => throw _privateConstructorUsedError;
  double get positionRatio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowRequestCopyWith<FollowRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowRequestCopyWith<$Res> {
  factory $FollowRequestCopyWith(
          FollowRequest value, $Res Function(FollowRequest) then) =
      _$FollowRequestCopyWithImpl<$Res, FollowRequest>;
  @useResult
  $Res call(
      {String strategyId,
      double allocation,
      double maxLoss,
      double positionRatio});
}

/// @nodoc
class _$FollowRequestCopyWithImpl<$Res, $Val extends FollowRequest>
    implements $FollowRequestCopyWith<$Res> {
  _$FollowRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? allocation = null,
    Object? maxLoss = null,
    Object? positionRatio = null,
  }) {
    return _then(_value.copyWith(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      allocation: null == allocation
          ? _value.allocation
          : allocation // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      positionRatio: null == positionRatio
          ? _value.positionRatio
          : positionRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowRequestImplCopyWith<$Res>
    implements $FollowRequestCopyWith<$Res> {
  factory _$$FollowRequestImplCopyWith(
          _$FollowRequestImpl value, $Res Function(_$FollowRequestImpl) then) =
      __$$FollowRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String strategyId,
      double allocation,
      double maxLoss,
      double positionRatio});
}

/// @nodoc
class __$$FollowRequestImplCopyWithImpl<$Res>
    extends _$FollowRequestCopyWithImpl<$Res, _$FollowRequestImpl>
    implements _$$FollowRequestImplCopyWith<$Res> {
  __$$FollowRequestImplCopyWithImpl(
      _$FollowRequestImpl _value, $Res Function(_$FollowRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? allocation = null,
    Object? maxLoss = null,
    Object? positionRatio = null,
  }) {
    return _then(_$FollowRequestImpl(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      allocation: null == allocation
          ? _value.allocation
          : allocation // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      positionRatio: null == positionRatio
          ? _value.positionRatio
          : positionRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowRequestImpl implements _FollowRequest {
  const _$FollowRequestImpl(
      {required this.strategyId,
      required this.allocation,
      required this.maxLoss,
      required this.positionRatio});

  factory _$FollowRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowRequestImplFromJson(json);

  @override
  final String strategyId;
  @override
  final double allocation;
  @override
  final double maxLoss;
  @override
  final double positionRatio;

  @override
  String toString() {
    return 'FollowRequest(strategyId: $strategyId, allocation: $allocation, maxLoss: $maxLoss, positionRatio: $positionRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowRequestImpl &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.allocation, allocation) ||
                other.allocation == allocation) &&
            (identical(other.maxLoss, maxLoss) || other.maxLoss == maxLoss) &&
            (identical(other.positionRatio, positionRatio) ||
                other.positionRatio == positionRatio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, strategyId, allocation, maxLoss, positionRatio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      __$$FollowRequestImplCopyWithImpl<_$FollowRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowRequestImplToJson(
      this,
    );
  }
}

abstract class _FollowRequest implements FollowRequest {
  const factory _FollowRequest(
      {required final String strategyId,
      required final double allocation,
      required final double maxLoss,
      required final double positionRatio}) = _$FollowRequestImpl;

  factory _FollowRequest.fromJson(Map<String, dynamic> json) =
      _$FollowRequestImpl.fromJson;

  @override
  String get strategyId;
  @override
  double get allocation;
  @override
  double get maxLoss;
  @override
  double get positionRatio;
  @override
  @JsonKey(ignore: true)
  _$$FollowRequestImplCopyWith<_$FollowRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowStatus _$FollowStatusFromJson(Map<String, dynamic> json) {
  return _FollowStatus.fromJson(json);
}

/// @nodoc
mixin _$FollowStatus {
  String get id => throw _privateConstructorUsedError;
  String get strategyId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double get allocation => throw _privateConstructorUsedError;
  double get maxLoss => throw _privateConstructorUsedError;
  double get positionRatio => throw _privateConstructorUsedError;
  double get totalProfit => throw _privateConstructorUsedError;
  double get totalProfitPercent => throw _privateConstructorUsedError;
  double get todayProfit => throw _privateConstructorUsedError;
  double get todayProfitPercent => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  double get maxDrawdownPercent => throw _privateConstructorUsedError;
  List<PerformanceData> get performanceData =>
      throw _privateConstructorUsedError;
  List<TradeHistory> get tradeHistory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowStatusCopyWith<FollowStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStatusCopyWith<$Res> {
  factory $FollowStatusCopyWith(
          FollowStatus value, $Res Function(FollowStatus) then) =
      _$FollowStatusCopyWithImpl<$Res, FollowStatus>;
  @useResult
  $Res call(
      {String id,
      String strategyId,
      String status,
      double allocation,
      double maxLoss,
      double positionRatio,
      double totalProfit,
      double totalProfitPercent,
      double todayProfit,
      double todayProfitPercent,
      double maxDrawdown,
      double maxDrawdownPercent,
      List<PerformanceData> performanceData,
      List<TradeHistory> tradeHistory});
}

/// @nodoc
class _$FollowStatusCopyWithImpl<$Res, $Val extends FollowStatus>
    implements $FollowStatusCopyWith<$Res> {
  _$FollowStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? strategyId = null,
    Object? status = null,
    Object? allocation = null,
    Object? maxLoss = null,
    Object? positionRatio = null,
    Object? totalProfit = null,
    Object? totalProfitPercent = null,
    Object? todayProfit = null,
    Object? todayProfitPercent = null,
    Object? maxDrawdown = null,
    Object? maxDrawdownPercent = null,
    Object? performanceData = null,
    Object? tradeHistory = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      allocation: null == allocation
          ? _value.allocation
          : allocation // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      positionRatio: null == positionRatio
          ? _value.positionRatio
          : positionRatio // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfitPercent: null == totalProfitPercent
          ? _value.totalProfitPercent
          : totalProfitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      todayProfit: null == todayProfit
          ? _value.todayProfit
          : todayProfit // ignore: cast_nullable_to_non_nullable
              as double,
      todayProfitPercent: null == todayProfitPercent
          ? _value.todayProfitPercent
          : todayProfitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdownPercent: null == maxDrawdownPercent
          ? _value.maxDrawdownPercent
          : maxDrawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
      performanceData: null == performanceData
          ? _value.performanceData
          : performanceData // ignore: cast_nullable_to_non_nullable
              as List<PerformanceData>,
      tradeHistory: null == tradeHistory
          ? _value.tradeHistory
          : tradeHistory // ignore: cast_nullable_to_non_nullable
              as List<TradeHistory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowStatusImplCopyWith<$Res>
    implements $FollowStatusCopyWith<$Res> {
  factory _$$FollowStatusImplCopyWith(
          _$FollowStatusImpl value, $Res Function(_$FollowStatusImpl) then) =
      __$$FollowStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String strategyId,
      String status,
      double allocation,
      double maxLoss,
      double positionRatio,
      double totalProfit,
      double totalProfitPercent,
      double todayProfit,
      double todayProfitPercent,
      double maxDrawdown,
      double maxDrawdownPercent,
      List<PerformanceData> performanceData,
      List<TradeHistory> tradeHistory});
}

/// @nodoc
class __$$FollowStatusImplCopyWithImpl<$Res>
    extends _$FollowStatusCopyWithImpl<$Res, _$FollowStatusImpl>
    implements _$$FollowStatusImplCopyWith<$Res> {
  __$$FollowStatusImplCopyWithImpl(
      _$FollowStatusImpl _value, $Res Function(_$FollowStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? strategyId = null,
    Object? status = null,
    Object? allocation = null,
    Object? maxLoss = null,
    Object? positionRatio = null,
    Object? totalProfit = null,
    Object? totalProfitPercent = null,
    Object? todayProfit = null,
    Object? todayProfitPercent = null,
    Object? maxDrawdown = null,
    Object? maxDrawdownPercent = null,
    Object? performanceData = null,
    Object? tradeHistory = null,
  }) {
    return _then(_$FollowStatusImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      allocation: null == allocation
          ? _value.allocation
          : allocation // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      positionRatio: null == positionRatio
          ? _value.positionRatio
          : positionRatio // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfitPercent: null == totalProfitPercent
          ? _value.totalProfitPercent
          : totalProfitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      todayProfit: null == todayProfit
          ? _value.todayProfit
          : todayProfit // ignore: cast_nullable_to_non_nullable
              as double,
      todayProfitPercent: null == todayProfitPercent
          ? _value.todayProfitPercent
          : todayProfitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdownPercent: null == maxDrawdownPercent
          ? _value.maxDrawdownPercent
          : maxDrawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
      performanceData: null == performanceData
          ? _value._performanceData
          : performanceData // ignore: cast_nullable_to_non_nullable
              as List<PerformanceData>,
      tradeHistory: null == tradeHistory
          ? _value._tradeHistory
          : tradeHistory // ignore: cast_nullable_to_non_nullable
              as List<TradeHistory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowStatusImpl implements _FollowStatus {
  const _$FollowStatusImpl(
      {required this.id,
      required this.strategyId,
      required this.status,
      required this.allocation,
      required this.maxLoss,
      required this.positionRatio,
      required this.totalProfit,
      required this.totalProfitPercent,
      required this.todayProfit,
      required this.todayProfitPercent,
      required this.maxDrawdown,
      required this.maxDrawdownPercent,
      required final List<PerformanceData> performanceData,
      required final List<TradeHistory> tradeHistory})
      : _performanceData = performanceData,
        _tradeHistory = tradeHistory;

  factory _$FollowStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowStatusImplFromJson(json);

  @override
  final String id;
  @override
  final String strategyId;
  @override
  final String status;
  @override
  final double allocation;
  @override
  final double maxLoss;
  @override
  final double positionRatio;
  @override
  final double totalProfit;
  @override
  final double totalProfitPercent;
  @override
  final double todayProfit;
  @override
  final double todayProfitPercent;
  @override
  final double maxDrawdown;
  @override
  final double maxDrawdownPercent;
  final List<PerformanceData> _performanceData;
  @override
  List<PerformanceData> get performanceData {
    if (_performanceData is EqualUnmodifiableListView) return _performanceData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_performanceData);
  }

  final List<TradeHistory> _tradeHistory;
  @override
  List<TradeHistory> get tradeHistory {
    if (_tradeHistory is EqualUnmodifiableListView) return _tradeHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tradeHistory);
  }

  @override
  String toString() {
    return 'FollowStatus(id: $id, strategyId: $strategyId, status: $status, allocation: $allocation, maxLoss: $maxLoss, positionRatio: $positionRatio, totalProfit: $totalProfit, totalProfitPercent: $totalProfitPercent, todayProfit: $todayProfit, todayProfitPercent: $todayProfitPercent, maxDrawdown: $maxDrawdown, maxDrawdownPercent: $maxDrawdownPercent, performanceData: $performanceData, tradeHistory: $tradeHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStatusImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.allocation, allocation) ||
                other.allocation == allocation) &&
            (identical(other.maxLoss, maxLoss) || other.maxLoss == maxLoss) &&
            (identical(other.positionRatio, positionRatio) ||
                other.positionRatio == positionRatio) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.totalProfitPercent, totalProfitPercent) ||
                other.totalProfitPercent == totalProfitPercent) &&
            (identical(other.todayProfit, todayProfit) ||
                other.todayProfit == todayProfit) &&
            (identical(other.todayProfitPercent, todayProfitPercent) ||
                other.todayProfitPercent == todayProfitPercent) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.maxDrawdownPercent, maxDrawdownPercent) ||
                other.maxDrawdownPercent == maxDrawdownPercent) &&
            const DeepCollectionEquality()
                .equals(other._performanceData, _performanceData) &&
            const DeepCollectionEquality()
                .equals(other._tradeHistory, _tradeHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      strategyId,
      status,
      allocation,
      maxLoss,
      positionRatio,
      totalProfit,
      totalProfitPercent,
      todayProfit,
      todayProfitPercent,
      maxDrawdown,
      maxDrawdownPercent,
      const DeepCollectionEquality().hash(_performanceData),
      const DeepCollectionEquality().hash(_tradeHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStatusImplCopyWith<_$FollowStatusImpl> get copyWith =>
      __$$FollowStatusImplCopyWithImpl<_$FollowStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowStatusImplToJson(
      this,
    );
  }
}

abstract class _FollowStatus implements FollowStatus {
  const factory _FollowStatus(
      {required final String id,
      required final String strategyId,
      required final String status,
      required final double allocation,
      required final double maxLoss,
      required final double positionRatio,
      required final double totalProfit,
      required final double totalProfitPercent,
      required final double todayProfit,
      required final double todayProfitPercent,
      required final double maxDrawdown,
      required final double maxDrawdownPercent,
      required final List<PerformanceData> performanceData,
      required final List<TradeHistory> tradeHistory}) = _$FollowStatusImpl;

  factory _FollowStatus.fromJson(Map<String, dynamic> json) =
      _$FollowStatusImpl.fromJson;

  @override
  String get id;
  @override
  String get strategyId;
  @override
  String get status;
  @override
  double get allocation;
  @override
  double get maxLoss;
  @override
  double get positionRatio;
  @override
  double get totalProfit;
  @override
  double get totalProfitPercent;
  @override
  double get todayProfit;
  @override
  double get todayProfitPercent;
  @override
  double get maxDrawdown;
  @override
  double get maxDrawdownPercent;
  @override
  List<PerformanceData> get performanceData;
  @override
  List<TradeHistory> get tradeHistory;
  @override
  @JsonKey(ignore: true)
  _$$FollowStatusImplCopyWith<_$FollowStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformanceData _$PerformanceDataFromJson(Map<String, dynamic> json) {
  return _PerformanceData.fromJson(json);
}

/// @nodoc
mixin _$PerformanceData {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  double get drawdown => throw _privateConstructorUsedError;
  double get drawdownPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformanceDataCopyWith<PerformanceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceDataCopyWith<$Res> {
  factory $PerformanceDataCopyWith(
          PerformanceData value, $Res Function(PerformanceData) then) =
      _$PerformanceDataCopyWithImpl<$Res, PerformanceData>;
  @useResult
  $Res call(
      {DateTime timestamp,
      double profit,
      double profitPercent,
      double drawdown,
      double drawdownPercent});
}

/// @nodoc
class _$PerformanceDataCopyWithImpl<$Res, $Val extends PerformanceData>
    implements $PerformanceDataCopyWith<$Res> {
  _$PerformanceDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? drawdown = null,
    Object? drawdownPercent = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      drawdown: null == drawdown
          ? _value.drawdown
          : drawdown // ignore: cast_nullable_to_non_nullable
              as double,
      drawdownPercent: null == drawdownPercent
          ? _value.drawdownPercent
          : drawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformanceDataImplCopyWith<$Res>
    implements $PerformanceDataCopyWith<$Res> {
  factory _$$PerformanceDataImplCopyWith(_$PerformanceDataImpl value,
          $Res Function(_$PerformanceDataImpl) then) =
      __$$PerformanceDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime timestamp,
      double profit,
      double profitPercent,
      double drawdown,
      double drawdownPercent});
}

/// @nodoc
class __$$PerformanceDataImplCopyWithImpl<$Res>
    extends _$PerformanceDataCopyWithImpl<$Res, _$PerformanceDataImpl>
    implements _$$PerformanceDataImplCopyWith<$Res> {
  __$$PerformanceDataImplCopyWithImpl(
      _$PerformanceDataImpl _value, $Res Function(_$PerformanceDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? drawdown = null,
    Object? drawdownPercent = null,
  }) {
    return _then(_$PerformanceDataImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      drawdown: null == drawdown
          ? _value.drawdown
          : drawdown // ignore: cast_nullable_to_non_nullable
              as double,
      drawdownPercent: null == drawdownPercent
          ? _value.drawdownPercent
          : drawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceDataImpl implements _PerformanceData {
  const _$PerformanceDataImpl(
      {required this.timestamp,
      required this.profit,
      required this.profitPercent,
      required this.drawdown,
      required this.drawdownPercent});

  factory _$PerformanceDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceDataImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final double drawdown;
  @override
  final double drawdownPercent;

  @override
  String toString() {
    return 'PerformanceData(timestamp: $timestamp, profit: $profit, profitPercent: $profitPercent, drawdown: $drawdown, drawdownPercent: $drawdownPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceDataImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.drawdown, drawdown) ||
                other.drawdown == drawdown) &&
            (identical(other.drawdownPercent, drawdownPercent) ||
                other.drawdownPercent == drawdownPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, timestamp, profit, profitPercent, drawdown, drawdownPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceDataImplCopyWith<_$PerformanceDataImpl> get copyWith =>
      __$$PerformanceDataImplCopyWithImpl<_$PerformanceDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceDataImplToJson(
      this,
    );
  }
}

abstract class _PerformanceData implements PerformanceData {
  const factory _PerformanceData(
      {required final DateTime timestamp,
      required final double profit,
      required final double profitPercent,
      required final double drawdown,
      required final double drawdownPercent}) = _$PerformanceDataImpl;

  factory _PerformanceData.fromJson(Map<String, dynamic> json) =
      _$PerformanceDataImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  double get drawdown;
  @override
  double get drawdownPercent;
  @override
  @JsonKey(ignore: true)
  _$$PerformanceDataImplCopyWith<_$PerformanceDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeHistory _$TradeHistoryFromJson(Map<String, dynamic> json) {
  return _TradeHistory.fromJson(json);
}

/// @nodoc
mixin _$TradeHistory {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get side => throw _privateConstructorUsedError;
  double get openPrice => throw _privateConstructorUsedError;
  double get closePrice => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  DateTime get openTime => throw _privateConstructorUsedError;
  DateTime get closeTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TradeHistoryCopyWith<TradeHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeHistoryCopyWith<$Res> {
  factory $TradeHistoryCopyWith(
          TradeHistory value, $Res Function(TradeHistory) then) =
      _$TradeHistoryCopyWithImpl<$Res, TradeHistory>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String side,
      double openPrice,
      double closePrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      DateTime closeTime});
}

/// @nodoc
class _$TradeHistoryCopyWithImpl<$Res, $Val extends TradeHistory>
    implements $TradeHistoryCopyWith<$Res> {
  _$TradeHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? side = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? closeTime = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeHistoryImplCopyWith<$Res>
    implements $TradeHistoryCopyWith<$Res> {
  factory _$$TradeHistoryImplCopyWith(
          _$TradeHistoryImpl value, $Res Function(_$TradeHistoryImpl) then) =
      __$$TradeHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String side,
      double openPrice,
      double closePrice,
      double quantity,
      double profit,
      double profitPercent,
      DateTime openTime,
      DateTime closeTime});
}

/// @nodoc
class __$$TradeHistoryImplCopyWithImpl<$Res>
    extends _$TradeHistoryCopyWithImpl<$Res, _$TradeHistoryImpl>
    implements _$$TradeHistoryImplCopyWith<$Res> {
  __$$TradeHistoryImplCopyWithImpl(
      _$TradeHistoryImpl _value, $Res Function(_$TradeHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? side = null,
    Object? openPrice = null,
    Object? closePrice = null,
    Object? quantity = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? openTime = null,
    Object? closeTime = null,
  }) {
    return _then(_$TradeHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradeHistoryImpl implements _TradeHistory {
  const _$TradeHistoryImpl(
      {required this.id,
      required this.symbol,
      required this.side,
      required this.openPrice,
      required this.closePrice,
      required this.quantity,
      required this.profit,
      required this.profitPercent,
      required this.openTime,
      required this.closeTime});

  factory _$TradeHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
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
  String toString() {
    return 'TradeHistory(id: $id, symbol: $symbol, side: $side, openPrice: $openPrice, closePrice: $closePrice, quantity: $quantity, profit: $profit, profitPercent: $profitPercent, openTime: $openTime, closeTime: $closeTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
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
                other.closeTime == closeTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, side, openPrice,
      closePrice, quantity, profit, profitPercent, openTime, closeTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeHistoryImplCopyWith<_$TradeHistoryImpl> get copyWith =>
      __$$TradeHistoryImplCopyWithImpl<_$TradeHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TradeHistoryImplToJson(
      this,
    );
  }
}

abstract class _TradeHistory implements TradeHistory {
  const factory _TradeHistory(
      {required final String id,
      required final String symbol,
      required final String side,
      required final double openPrice,
      required final double closePrice,
      required final double quantity,
      required final double profit,
      required final double profitPercent,
      required final DateTime openTime,
      required final DateTime closeTime}) = _$TradeHistoryImpl;

  factory _TradeHistory.fromJson(Map<String, dynamic> json) =
      _$TradeHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
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
  @JsonKey(ignore: true)
  _$$TradeHistoryImplCopyWith<_$TradeHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FollowStats _$FollowStatsFromJson(Map<String, dynamic> json) {
  return _FollowStats.fromJson(json);
}

/// @nodoc
mixin _$FollowStats {
  int get totalTrades => throw _privateConstructorUsedError;
  int get winningTrades => throw _privateConstructorUsedError;
  int get losingTrades => throw _privateConstructorUsedError;
  double get winRate => throw _privateConstructorUsedError;
  double get averageWin => throw _privateConstructorUsedError;
  double get averageLoss => throw _privateConstructorUsedError;
  double get profitFactor => throw _privateConstructorUsedError;
  double get sharpeRatio => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  double get maxDrawdownPercent => throw _privateConstructorUsedError;
  double get recoveryFactor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowStatsCopyWith<FollowStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowStatsCopyWith<$Res> {
  factory $FollowStatsCopyWith(
          FollowStats value, $Res Function(FollowStats) then) =
      _$FollowStatsCopyWithImpl<$Res, FollowStats>;
  @useResult
  $Res call(
      {int totalTrades,
      int winningTrades,
      int losingTrades,
      double winRate,
      double averageWin,
      double averageLoss,
      double profitFactor,
      double sharpeRatio,
      double maxDrawdown,
      double maxDrawdownPercent,
      double recoveryFactor});
}

/// @nodoc
class _$FollowStatsCopyWithImpl<$Res, $Val extends FollowStats>
    implements $FollowStatsCopyWith<$Res> {
  _$FollowStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTrades = null,
    Object? winningTrades = null,
    Object? losingTrades = null,
    Object? winRate = null,
    Object? averageWin = null,
    Object? averageLoss = null,
    Object? profitFactor = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? maxDrawdownPercent = null,
    Object? recoveryFactor = null,
  }) {
    return _then(_value.copyWith(
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winningTrades: null == winningTrades
          ? _value.winningTrades
          : winningTrades // ignore: cast_nullable_to_non_nullable
              as int,
      losingTrades: null == losingTrades
          ? _value.losingTrades
          : losingTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageWin: null == averageWin
          ? _value.averageWin
          : averageWin // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      profitFactor: null == profitFactor
          ? _value.profitFactor
          : profitFactor // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdownPercent: null == maxDrawdownPercent
          ? _value.maxDrawdownPercent
          : maxDrawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
      recoveryFactor: null == recoveryFactor
          ? _value.recoveryFactor
          : recoveryFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FollowStatsImplCopyWith<$Res>
    implements $FollowStatsCopyWith<$Res> {
  factory _$$FollowStatsImplCopyWith(
          _$FollowStatsImpl value, $Res Function(_$FollowStatsImpl) then) =
      __$$FollowStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalTrades,
      int winningTrades,
      int losingTrades,
      double winRate,
      double averageWin,
      double averageLoss,
      double profitFactor,
      double sharpeRatio,
      double maxDrawdown,
      double maxDrawdownPercent,
      double recoveryFactor});
}

/// @nodoc
class __$$FollowStatsImplCopyWithImpl<$Res>
    extends _$FollowStatsCopyWithImpl<$Res, _$FollowStatsImpl>
    implements _$$FollowStatsImplCopyWith<$Res> {
  __$$FollowStatsImplCopyWithImpl(
      _$FollowStatsImpl _value, $Res Function(_$FollowStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTrades = null,
    Object? winningTrades = null,
    Object? losingTrades = null,
    Object? winRate = null,
    Object? averageWin = null,
    Object? averageLoss = null,
    Object? profitFactor = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? maxDrawdownPercent = null,
    Object? recoveryFactor = null,
  }) {
    return _then(_$FollowStatsImpl(
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winningTrades: null == winningTrades
          ? _value.winningTrades
          : winningTrades // ignore: cast_nullable_to_non_nullable
              as int,
      losingTrades: null == losingTrades
          ? _value.losingTrades
          : losingTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      averageWin: null == averageWin
          ? _value.averageWin
          : averageWin // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      profitFactor: null == profitFactor
          ? _value.profitFactor
          : profitFactor // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdownPercent: null == maxDrawdownPercent
          ? _value.maxDrawdownPercent
          : maxDrawdownPercent // ignore: cast_nullable_to_non_nullable
              as double,
      recoveryFactor: null == recoveryFactor
          ? _value.recoveryFactor
          : recoveryFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FollowStatsImpl implements _FollowStats {
  const _$FollowStatsImpl(
      {required this.totalTrades,
      required this.winningTrades,
      required this.losingTrades,
      required this.winRate,
      required this.averageWin,
      required this.averageLoss,
      required this.profitFactor,
      required this.sharpeRatio,
      required this.maxDrawdown,
      required this.maxDrawdownPercent,
      required this.recoveryFactor});

  factory _$FollowStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FollowStatsImplFromJson(json);

  @override
  final int totalTrades;
  @override
  final int winningTrades;
  @override
  final int losingTrades;
  @override
  final double winRate;
  @override
  final double averageWin;
  @override
  final double averageLoss;
  @override
  final double profitFactor;
  @override
  final double sharpeRatio;
  @override
  final double maxDrawdown;
  @override
  final double maxDrawdownPercent;
  @override
  final double recoveryFactor;

  @override
  String toString() {
    return 'FollowStats(totalTrades: $totalTrades, winningTrades: $winningTrades, losingTrades: $losingTrades, winRate: $winRate, averageWin: $averageWin, averageLoss: $averageLoss, profitFactor: $profitFactor, sharpeRatio: $sharpeRatio, maxDrawdown: $maxDrawdown, maxDrawdownPercent: $maxDrawdownPercent, recoveryFactor: $recoveryFactor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FollowStatsImpl &&
            (identical(other.totalTrades, totalTrades) ||
                other.totalTrades == totalTrades) &&
            (identical(other.winningTrades, winningTrades) ||
                other.winningTrades == winningTrades) &&
            (identical(other.losingTrades, losingTrades) ||
                other.losingTrades == losingTrades) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.averageWin, averageWin) ||
                other.averageWin == averageWin) &&
            (identical(other.averageLoss, averageLoss) ||
                other.averageLoss == averageLoss) &&
            (identical(other.profitFactor, profitFactor) ||
                other.profitFactor == profitFactor) &&
            (identical(other.sharpeRatio, sharpeRatio) ||
                other.sharpeRatio == sharpeRatio) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.maxDrawdownPercent, maxDrawdownPercent) ||
                other.maxDrawdownPercent == maxDrawdownPercent) &&
            (identical(other.recoveryFactor, recoveryFactor) ||
                other.recoveryFactor == recoveryFactor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalTrades,
      winningTrades,
      losingTrades,
      winRate,
      averageWin,
      averageLoss,
      profitFactor,
      sharpeRatio,
      maxDrawdown,
      maxDrawdownPercent,
      recoveryFactor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FollowStatsImplCopyWith<_$FollowStatsImpl> get copyWith =>
      __$$FollowStatsImplCopyWithImpl<_$FollowStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FollowStatsImplToJson(
      this,
    );
  }
}

abstract class _FollowStats implements FollowStats {
  const factory _FollowStats(
      {required final int totalTrades,
      required final int winningTrades,
      required final int losingTrades,
      required final double winRate,
      required final double averageWin,
      required final double averageLoss,
      required final double profitFactor,
      required final double sharpeRatio,
      required final double maxDrawdown,
      required final double maxDrawdownPercent,
      required final double recoveryFactor}) = _$FollowStatsImpl;

  factory _FollowStats.fromJson(Map<String, dynamic> json) =
      _$FollowStatsImpl.fromJson;

  @override
  int get totalTrades;
  @override
  int get winningTrades;
  @override
  int get losingTrades;
  @override
  double get winRate;
  @override
  double get averageWin;
  @override
  double get averageLoss;
  @override
  double get profitFactor;
  @override
  double get sharpeRatio;
  @override
  double get maxDrawdown;
  @override
  double get maxDrawdownPercent;
  @override
  double get recoveryFactor;
  @override
  @JsonKey(ignore: true)
  _$$FollowStatsImplCopyWith<_$FollowStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
