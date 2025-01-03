// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strategy_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Strategy _$StrategyFromJson(Map<String, dynamic> json) {
  return _Strategy.fromJson(json);
}

/// @nodoc
mixin _$Strategy {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get totalReturn => throw _privateConstructorUsedError;
  double get monthlyReturn => throw _privateConstructorUsedError;
  double get sharpeRatio => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  int get followersCount => throw _privateConstructorUsedError;
  List<String> get tradingPairs => throw _privateConstructorUsedError;
  List<TradeHistory> get recentTrades => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  String? get creatorId => throw _privateConstructorUsedError;
  String? get creatorName => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrategyCopyWith<Strategy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrategyCopyWith<$Res> {
  factory $StrategyCopyWith(Strategy value, $Res Function(Strategy) then) =
      _$StrategyCopyWithImpl<$Res, Strategy>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double totalReturn,
      double monthlyReturn,
      double sharpeRatio,
      double maxDrawdown,
      int followersCount,
      List<String> tradingPairs,
      List<TradeHistory> recentTrades,
      bool isFollowing,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt});
}

/// @nodoc
class _$StrategyCopyWithImpl<$Res, $Val extends Strategy>
    implements $StrategyCopyWith<$Res> {
  _$StrategyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? totalReturn = null,
    Object? monthlyReturn = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? followersCount = null,
    Object? tradingPairs = null,
    Object? recentTrades = null,
    Object? isFollowing = null,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalReturn: null == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyReturn: null == monthlyReturn
          ? _value.monthlyReturn
          : monthlyReturn // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      tradingPairs: null == tradingPairs
          ? _value.tradingPairs
          : tradingPairs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentTrades: null == recentTrades
          ? _value.recentTrades
          : recentTrades // ignore: cast_nullable_to_non_nullable
              as List<TradeHistory>,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorName: freezed == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrategyImplCopyWith<$Res>
    implements $StrategyCopyWith<$Res> {
  factory _$$StrategyImplCopyWith(
          _$StrategyImpl value, $Res Function(_$StrategyImpl) then) =
      __$$StrategyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double totalReturn,
      double monthlyReturn,
      double sharpeRatio,
      double maxDrawdown,
      int followersCount,
      List<String> tradingPairs,
      List<TradeHistory> recentTrades,
      bool isFollowing,
      String? creatorId,
      String? creatorName,
      DateTime? createdAt});
}

/// @nodoc
class __$$StrategyImplCopyWithImpl<$Res>
    extends _$StrategyCopyWithImpl<$Res, _$StrategyImpl>
    implements _$$StrategyImplCopyWith<$Res> {
  __$$StrategyImplCopyWithImpl(
      _$StrategyImpl _value, $Res Function(_$StrategyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? totalReturn = null,
    Object? monthlyReturn = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? followersCount = null,
    Object? tradingPairs = null,
    Object? recentTrades = null,
    Object? isFollowing = null,
    Object? creatorId = freezed,
    Object? creatorName = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$StrategyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      totalReturn: null == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyReturn: null == monthlyReturn
          ? _value.monthlyReturn
          : monthlyReturn // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      followersCount: null == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int,
      tradingPairs: null == tradingPairs
          ? _value._tradingPairs
          : tradingPairs // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentTrades: null == recentTrades
          ? _value._recentTrades
          : recentTrades // ignore: cast_nullable_to_non_nullable
              as List<TradeHistory>,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      creatorId: freezed == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorName: freezed == creatorName
          ? _value.creatorName
          : creatorName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrategyImpl implements _Strategy {
  const _$StrategyImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.totalReturn,
      required this.monthlyReturn,
      required this.sharpeRatio,
      required this.maxDrawdown,
      required this.followersCount,
      required final List<String> tradingPairs,
      required final List<TradeHistory> recentTrades,
      this.isFollowing = false,
      this.creatorId,
      this.creatorName,
      this.createdAt})
      : _tradingPairs = tradingPairs,
        _recentTrades = recentTrades;

  factory _$StrategyImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrategyImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double totalReturn;
  @override
  final double monthlyReturn;
  @override
  final double sharpeRatio;
  @override
  final double maxDrawdown;
  @override
  final int followersCount;
  final List<String> _tradingPairs;
  @override
  List<String> get tradingPairs {
    if (_tradingPairs is EqualUnmodifiableListView) return _tradingPairs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tradingPairs);
  }

  final List<TradeHistory> _recentTrades;
  @override
  List<TradeHistory> get recentTrades {
    if (_recentTrades is EqualUnmodifiableListView) return _recentTrades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTrades);
  }

  @override
  @JsonKey()
  final bool isFollowing;
  @override
  final String? creatorId;
  @override
  final String? creatorName;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'Strategy(id: $id, name: $name, description: $description, totalReturn: $totalReturn, monthlyReturn: $monthlyReturn, sharpeRatio: $sharpeRatio, maxDrawdown: $maxDrawdown, followersCount: $followersCount, tradingPairs: $tradingPairs, recentTrades: $recentTrades, isFollowing: $isFollowing, creatorId: $creatorId, creatorName: $creatorName, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrategyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalReturn, totalReturn) ||
                other.totalReturn == totalReturn) &&
            (identical(other.monthlyReturn, monthlyReturn) ||
                other.monthlyReturn == monthlyReturn) &&
            (identical(other.sharpeRatio, sharpeRatio) ||
                other.sharpeRatio == sharpeRatio) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            const DeepCollectionEquality()
                .equals(other._tradingPairs, _tradingPairs) &&
            const DeepCollectionEquality()
                .equals(other._recentTrades, _recentTrades) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.creatorName, creatorName) ||
                other.creatorName == creatorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      totalReturn,
      monthlyReturn,
      sharpeRatio,
      maxDrawdown,
      followersCount,
      const DeepCollectionEquality().hash(_tradingPairs),
      const DeepCollectionEquality().hash(_recentTrades),
      isFollowing,
      creatorId,
      creatorName,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrategyImplCopyWith<_$StrategyImpl> get copyWith =>
      __$$StrategyImplCopyWithImpl<_$StrategyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrategyImplToJson(
      this,
    );
  }
}

abstract class _Strategy implements Strategy {
  const factory _Strategy(
      {required final String id,
      required final String name,
      required final String description,
      required final double totalReturn,
      required final double monthlyReturn,
      required final double sharpeRatio,
      required final double maxDrawdown,
      required final int followersCount,
      required final List<String> tradingPairs,
      required final List<TradeHistory> recentTrades,
      final bool isFollowing,
      final String? creatorId,
      final String? creatorName,
      final DateTime? createdAt}) = _$StrategyImpl;

  factory _Strategy.fromJson(Map<String, dynamic> json) =
      _$StrategyImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get totalReturn;
  @override
  double get monthlyReturn;
  @override
  double get sharpeRatio;
  @override
  double get maxDrawdown;
  @override
  int get followersCount;
  @override
  List<String> get tradingPairs;
  @override
  List<TradeHistory> get recentTrades;
  @override
  bool get isFollowing;
  @override
  String? get creatorId;
  @override
  String? get creatorName;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$StrategyImplCopyWith<_$StrategyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeHistory _$TradeHistoryFromJson(Map<String, dynamic> json) {
  return _TradeHistory.fromJson(json);
}

/// @nodoc
mixin _$TradeHistory {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  double get entryPrice => throw _privateConstructorUsedError;
  double get exitPrice => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  DateTime get entryTime => throw _privateConstructorUsedError;
  DateTime get exitTime => throw _privateConstructorUsedError;

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
      String type,
      double entryPrice,
      double exitPrice,
      double profit,
      double profitPercent,
      DateTime entryTime,
      DateTime exitTime});
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
    Object? type = null,
    Object? entryPrice = null,
    Object? exitPrice = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? entryTime = null,
    Object? exitTime = null,
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
      entryPrice: null == entryPrice
          ? _value.entryPrice
          : entryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      exitPrice: null == exitPrice
          ? _value.exitPrice
          : exitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitTime: null == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
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
      String type,
      double entryPrice,
      double exitPrice,
      double profit,
      double profitPercent,
      DateTime entryTime,
      DateTime exitTime});
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
    Object? type = null,
    Object? entryPrice = null,
    Object? exitPrice = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? entryTime = null,
    Object? exitTime = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entryPrice: null == entryPrice
          ? _value.entryPrice
          : entryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      exitPrice: null == exitPrice
          ? _value.exitPrice
          : exitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      entryTime: null == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitTime: null == exitTime
          ? _value.exitTime
          : exitTime // ignore: cast_nullable_to_non_nullable
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
      required this.type,
      required this.entryPrice,
      required this.exitPrice,
      required this.profit,
      required this.profitPercent,
      required this.entryTime,
      required this.exitTime});

  factory _$TradeHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String type;
  @override
  final double entryPrice;
  @override
  final double exitPrice;
  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final DateTime entryTime;
  @override
  final DateTime exitTime;

  @override
  String toString() {
    return 'TradeHistory(id: $id, symbol: $symbol, type: $type, entryPrice: $entryPrice, exitPrice: $exitPrice, profit: $profit, profitPercent: $profitPercent, entryTime: $entryTime, exitTime: $exitTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.entryPrice, entryPrice) ||
                other.entryPrice == entryPrice) &&
            (identical(other.exitPrice, exitPrice) ||
                other.exitPrice == exitPrice) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, type, entryPrice,
      exitPrice, profit, profitPercent, entryTime, exitTime);

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
      required final String type,
      required final double entryPrice,
      required final double exitPrice,
      required final double profit,
      required final double profitPercent,
      required final DateTime entryTime,
      required final DateTime exitTime}) = _$TradeHistoryImpl;

  factory _TradeHistory.fromJson(Map<String, dynamic> json) =
      _$TradeHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get type;
  @override
  double get entryPrice;
  @override
  double get exitPrice;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  DateTime get entryTime;
  @override
  DateTime get exitTime;
  @override
  @JsonKey(ignore: true)
  _$$TradeHistoryImplCopyWith<_$TradeHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StrategyPerformance _$StrategyPerformanceFromJson(Map<String, dynamic> json) {
  return _StrategyPerformance.fromJson(json);
}

/// @nodoc
mixin _$StrategyPerformance {
  String get strategyId => throw _privateConstructorUsedError;
  List<PerformancePoint> get points => throw _privateConstructorUsedError;
  double get totalReturn => throw _privateConstructorUsedError;
  double get monthlyReturn => throw _privateConstructorUsedError;
  double get sharpeRatio => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  int get winRate => throw _privateConstructorUsedError;
  int get totalTrades => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrategyPerformanceCopyWith<StrategyPerformance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrategyPerformanceCopyWith<$Res> {
  factory $StrategyPerformanceCopyWith(
          StrategyPerformance value, $Res Function(StrategyPerformance) then) =
      _$StrategyPerformanceCopyWithImpl<$Res, StrategyPerformance>;
  @useResult
  $Res call(
      {String strategyId,
      List<PerformancePoint> points,
      double totalReturn,
      double monthlyReturn,
      double sharpeRatio,
      double maxDrawdown,
      int winRate,
      int totalTrades});
}

/// @nodoc
class _$StrategyPerformanceCopyWithImpl<$Res, $Val extends StrategyPerformance>
    implements $StrategyPerformanceCopyWith<$Res> {
  _$StrategyPerformanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? points = null,
    Object? totalReturn = null,
    Object? monthlyReturn = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? winRate = null,
    Object? totalTrades = null,
  }) {
    return _then(_value.copyWith(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PerformancePoint>,
      totalReturn: null == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyReturn: null == monthlyReturn
          ? _value.monthlyReturn
          : monthlyReturn // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrategyPerformanceImplCopyWith<$Res>
    implements $StrategyPerformanceCopyWith<$Res> {
  factory _$$StrategyPerformanceImplCopyWith(_$StrategyPerformanceImpl value,
          $Res Function(_$StrategyPerformanceImpl) then) =
      __$$StrategyPerformanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String strategyId,
      List<PerformancePoint> points,
      double totalReturn,
      double monthlyReturn,
      double sharpeRatio,
      double maxDrawdown,
      int winRate,
      int totalTrades});
}

/// @nodoc
class __$$StrategyPerformanceImplCopyWithImpl<$Res>
    extends _$StrategyPerformanceCopyWithImpl<$Res, _$StrategyPerformanceImpl>
    implements _$$StrategyPerformanceImplCopyWith<$Res> {
  __$$StrategyPerformanceImplCopyWithImpl(_$StrategyPerformanceImpl _value,
      $Res Function(_$StrategyPerformanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategyId = null,
    Object? points = null,
    Object? totalReturn = null,
    Object? monthlyReturn = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? winRate = null,
    Object? totalTrades = null,
  }) {
    return _then(_$StrategyPerformanceImpl(
      strategyId: null == strategyId
          ? _value.strategyId
          : strategyId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<PerformancePoint>,
      totalReturn: null == totalReturn
          ? _value.totalReturn
          : totalReturn // ignore: cast_nullable_to_non_nullable
              as double,
      monthlyReturn: null == monthlyReturn
          ? _value.monthlyReturn
          : monthlyReturn // ignore: cast_nullable_to_non_nullable
              as double,
      sharpeRatio: null == sharpeRatio
          ? _value.sharpeRatio
          : sharpeRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxDrawdown: null == maxDrawdown
          ? _value.maxDrawdown
          : maxDrawdown // ignore: cast_nullable_to_non_nullable
              as double,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as int,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrategyPerformanceImpl implements _StrategyPerformance {
  const _$StrategyPerformanceImpl(
      {required this.strategyId,
      required final List<PerformancePoint> points,
      required this.totalReturn,
      required this.monthlyReturn,
      required this.sharpeRatio,
      required this.maxDrawdown,
      required this.winRate,
      required this.totalTrades})
      : _points = points;

  factory _$StrategyPerformanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrategyPerformanceImplFromJson(json);

  @override
  final String strategyId;
  final List<PerformancePoint> _points;
  @override
  List<PerformancePoint> get points {
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final double totalReturn;
  @override
  final double monthlyReturn;
  @override
  final double sharpeRatio;
  @override
  final double maxDrawdown;
  @override
  final int winRate;
  @override
  final int totalTrades;

  @override
  String toString() {
    return 'StrategyPerformance(strategyId: $strategyId, points: $points, totalReturn: $totalReturn, monthlyReturn: $monthlyReturn, sharpeRatio: $sharpeRatio, maxDrawdown: $maxDrawdown, winRate: $winRate, totalTrades: $totalTrades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrategyPerformanceImpl &&
            (identical(other.strategyId, strategyId) ||
                other.strategyId == strategyId) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.totalReturn, totalReturn) ||
                other.totalReturn == totalReturn) &&
            (identical(other.monthlyReturn, monthlyReturn) ||
                other.monthlyReturn == monthlyReturn) &&
            (identical(other.sharpeRatio, sharpeRatio) ||
                other.sharpeRatio == sharpeRatio) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.totalTrades, totalTrades) ||
                other.totalTrades == totalTrades));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      strategyId,
      const DeepCollectionEquality().hash(_points),
      totalReturn,
      monthlyReturn,
      sharpeRatio,
      maxDrawdown,
      winRate,
      totalTrades);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrategyPerformanceImplCopyWith<_$StrategyPerformanceImpl> get copyWith =>
      __$$StrategyPerformanceImplCopyWithImpl<_$StrategyPerformanceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrategyPerformanceImplToJson(
      this,
    );
  }
}

abstract class _StrategyPerformance implements StrategyPerformance {
  const factory _StrategyPerformance(
      {required final String strategyId,
      required final List<PerformancePoint> points,
      required final double totalReturn,
      required final double monthlyReturn,
      required final double sharpeRatio,
      required final double maxDrawdown,
      required final int winRate,
      required final int totalTrades}) = _$StrategyPerformanceImpl;

  factory _StrategyPerformance.fromJson(Map<String, dynamic> json) =
      _$StrategyPerformanceImpl.fromJson;

  @override
  String get strategyId;
  @override
  List<PerformancePoint> get points;
  @override
  double get totalReturn;
  @override
  double get monthlyReturn;
  @override
  double get sharpeRatio;
  @override
  double get maxDrawdown;
  @override
  int get winRate;
  @override
  int get totalTrades;
  @override
  @JsonKey(ignore: true)
  _$$StrategyPerformanceImplCopyWith<_$StrategyPerformanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PerformancePoint _$PerformancePointFromJson(Map<String, dynamic> json) {
  return _PerformancePoint.fromJson(json);
}

/// @nodoc
mixin _$PerformancePoint {
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PerformancePointCopyWith<PerformancePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformancePointCopyWith<$Res> {
  factory $PerformancePointCopyWith(
          PerformancePoint value, $Res Function(PerformancePoint) then) =
      _$PerformancePointCopyWithImpl<$Res, PerformancePoint>;
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class _$PerformancePointCopyWithImpl<$Res, $Val extends PerformancePoint>
    implements $PerformancePointCopyWith<$Res> {
  _$PerformancePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PerformancePointImplCopyWith<$Res>
    implements $PerformancePointCopyWith<$Res> {
  factory _$$PerformancePointImplCopyWith(_$PerformancePointImpl value,
          $Res Function(_$PerformancePointImpl) then) =
      __$$PerformancePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime timestamp, double value});
}

/// @nodoc
class __$$PerformancePointImplCopyWithImpl<$Res>
    extends _$PerformancePointCopyWithImpl<$Res, _$PerformancePointImpl>
    implements _$$PerformancePointImplCopyWith<$Res> {
  __$$PerformancePointImplCopyWithImpl(_$PerformancePointImpl _value,
      $Res Function(_$PerformancePointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? value = null,
  }) {
    return _then(_$PerformancePointImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformancePointImpl implements _PerformancePoint {
  const _$PerformancePointImpl({required this.timestamp, required this.value});

  factory _$PerformancePointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformancePointImplFromJson(json);

  @override
  final DateTime timestamp;
  @override
  final double value;

  @override
  String toString() {
    return 'PerformancePoint(timestamp: $timestamp, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformancePointImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformancePointImplCopyWith<_$PerformancePointImpl> get copyWith =>
      __$$PerformancePointImplCopyWithImpl<_$PerformancePointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformancePointImplToJson(
      this,
    );
  }
}

abstract class _PerformancePoint implements PerformancePoint {
  const factory _PerformancePoint(
      {required final DateTime timestamp,
      required final double value}) = _$PerformancePointImpl;

  factory _PerformancePoint.fromJson(Map<String, dynamic> json) =
      _$PerformancePointImpl.fromJson;

  @override
  DateTime get timestamp;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$PerformancePointImplCopyWith<_$PerformancePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
