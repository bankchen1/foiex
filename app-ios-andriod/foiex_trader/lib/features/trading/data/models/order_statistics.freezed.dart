// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderStatistics _$OrderStatisticsFromJson(Map<String, dynamic> json) {
  return _OrderStatistics.fromJson(json);
}

/// @nodoc
mixin _$OrderStatistics {
  double get winRate => throw _privateConstructorUsedError;
  double get profitLossRatio => throw _privateConstructorUsedError;
  double get maxProfit => throw _privateConstructorUsedError;
  double get maxLoss => throw _privateConstructorUsedError;
  double get totalProfit => throw _privateConstructorUsedError;
  double get averageProfit => throw _privateConstructorUsedError;
  double get averageLoss => throw _privateConstructorUsedError;
  int get totalTrades => throw _privateConstructorUsedError;
  int get winTrades => throw _privateConstructorUsedError;
  int get lossTrades => throw _privateConstructorUsedError;
  double get profitFactor => throw _privateConstructorUsedError;
  double get sharpeRatio => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  double get averageHoldingTime => throw _privateConstructorUsedError;
  double get bestWinStreak => throw _privateConstructorUsedError;
  double get worstLossStreak => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatisticsCopyWith<OrderStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatisticsCopyWith<$Res> {
  factory $OrderStatisticsCopyWith(
          OrderStatistics value, $Res Function(OrderStatistics) then) =
      _$OrderStatisticsCopyWithImpl<$Res, OrderStatistics>;
  @useResult
  $Res call(
      {double winRate,
      double profitLossRatio,
      double maxProfit,
      double maxLoss,
      double totalProfit,
      double averageProfit,
      double averageLoss,
      int totalTrades,
      int winTrades,
      int lossTrades,
      double profitFactor,
      double sharpeRatio,
      double maxDrawdown,
      double averageHoldingTime,
      double bestWinStreak,
      double worstLossStreak});
}

/// @nodoc
class _$OrderStatisticsCopyWithImpl<$Res, $Val extends OrderStatistics>
    implements $OrderStatisticsCopyWith<$Res> {
  _$OrderStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRate = null,
    Object? profitLossRatio = null,
    Object? maxProfit = null,
    Object? maxLoss = null,
    Object? totalProfit = null,
    Object? averageProfit = null,
    Object? averageLoss = null,
    Object? totalTrades = null,
    Object? winTrades = null,
    Object? lossTrades = null,
    Object? profitFactor = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? averageHoldingTime = null,
    Object? bestWinStreak = null,
    Object? worstLossStreak = null,
  }) {
    return _then(_value.copyWith(
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      profitLossRatio: null == profitLossRatio
          ? _value.profitLossRatio
          : profitLossRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxProfit: null == maxProfit
          ? _value.maxProfit
          : maxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageProfit: null == averageProfit
          ? _value.averageProfit
          : averageProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winTrades: null == winTrades
          ? _value.winTrades
          : winTrades // ignore: cast_nullable_to_non_nullable
              as int,
      lossTrades: null == lossTrades
          ? _value.lossTrades
          : lossTrades // ignore: cast_nullable_to_non_nullable
              as int,
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
      averageHoldingTime: null == averageHoldingTime
          ? _value.averageHoldingTime
          : averageHoldingTime // ignore: cast_nullable_to_non_nullable
              as double,
      bestWinStreak: null == bestWinStreak
          ? _value.bestWinStreak
          : bestWinStreak // ignore: cast_nullable_to_non_nullable
              as double,
      worstLossStreak: null == worstLossStreak
          ? _value.worstLossStreak
          : worstLossStreak // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatisticsImplCopyWith<$Res>
    implements $OrderStatisticsCopyWith<$Res> {
  factory _$$OrderStatisticsImplCopyWith(_$OrderStatisticsImpl value,
          $Res Function(_$OrderStatisticsImpl) then) =
      __$$OrderStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double winRate,
      double profitLossRatio,
      double maxProfit,
      double maxLoss,
      double totalProfit,
      double averageProfit,
      double averageLoss,
      int totalTrades,
      int winTrades,
      int lossTrades,
      double profitFactor,
      double sharpeRatio,
      double maxDrawdown,
      double averageHoldingTime,
      double bestWinStreak,
      double worstLossStreak});
}

/// @nodoc
class __$$OrderStatisticsImplCopyWithImpl<$Res>
    extends _$OrderStatisticsCopyWithImpl<$Res, _$OrderStatisticsImpl>
    implements _$$OrderStatisticsImplCopyWith<$Res> {
  __$$OrderStatisticsImplCopyWithImpl(
      _$OrderStatisticsImpl _value, $Res Function(_$OrderStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winRate = null,
    Object? profitLossRatio = null,
    Object? maxProfit = null,
    Object? maxLoss = null,
    Object? totalProfit = null,
    Object? averageProfit = null,
    Object? averageLoss = null,
    Object? totalTrades = null,
    Object? winTrades = null,
    Object? lossTrades = null,
    Object? profitFactor = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? averageHoldingTime = null,
    Object? bestWinStreak = null,
    Object? worstLossStreak = null,
  }) {
    return _then(_$OrderStatisticsImpl(
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
      profitLossRatio: null == profitLossRatio
          ? _value.profitLossRatio
          : profitLossRatio // ignore: cast_nullable_to_non_nullable
              as double,
      maxProfit: null == maxProfit
          ? _value.maxProfit
          : maxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      maxLoss: null == maxLoss
          ? _value.maxLoss
          : maxLoss // ignore: cast_nullable_to_non_nullable
              as double,
      totalProfit: null == totalProfit
          ? _value.totalProfit
          : totalProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageProfit: null == averageProfit
          ? _value.averageProfit
          : averageProfit // ignore: cast_nullable_to_non_nullable
              as double,
      averageLoss: null == averageLoss
          ? _value.averageLoss
          : averageLoss // ignore: cast_nullable_to_non_nullable
              as double,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winTrades: null == winTrades
          ? _value.winTrades
          : winTrades // ignore: cast_nullable_to_non_nullable
              as int,
      lossTrades: null == lossTrades
          ? _value.lossTrades
          : lossTrades // ignore: cast_nullable_to_non_nullable
              as int,
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
      averageHoldingTime: null == averageHoldingTime
          ? _value.averageHoldingTime
          : averageHoldingTime // ignore: cast_nullable_to_non_nullable
              as double,
      bestWinStreak: null == bestWinStreak
          ? _value.bestWinStreak
          : bestWinStreak // ignore: cast_nullable_to_non_nullable
              as double,
      worstLossStreak: null == worstLossStreak
          ? _value.worstLossStreak
          : worstLossStreak // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatisticsImpl implements _OrderStatistics {
  const _$OrderStatisticsImpl(
      {required this.winRate,
      required this.profitLossRatio,
      required this.maxProfit,
      required this.maxLoss,
      required this.totalProfit,
      required this.averageProfit,
      required this.averageLoss,
      required this.totalTrades,
      required this.winTrades,
      required this.lossTrades,
      required this.profitFactor,
      required this.sharpeRatio,
      required this.maxDrawdown,
      required this.averageHoldingTime,
      required this.bestWinStreak,
      required this.worstLossStreak});

  factory _$OrderStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatisticsImplFromJson(json);

  @override
  final double winRate;
  @override
  final double profitLossRatio;
  @override
  final double maxProfit;
  @override
  final double maxLoss;
  @override
  final double totalProfit;
  @override
  final double averageProfit;
  @override
  final double averageLoss;
  @override
  final int totalTrades;
  @override
  final int winTrades;
  @override
  final int lossTrades;
  @override
  final double profitFactor;
  @override
  final double sharpeRatio;
  @override
  final double maxDrawdown;
  @override
  final double averageHoldingTime;
  @override
  final double bestWinStreak;
  @override
  final double worstLossStreak;

  @override
  String toString() {
    return 'OrderStatistics(winRate: $winRate, profitLossRatio: $profitLossRatio, maxProfit: $maxProfit, maxLoss: $maxLoss, totalProfit: $totalProfit, averageProfit: $averageProfit, averageLoss: $averageLoss, totalTrades: $totalTrades, winTrades: $winTrades, lossTrades: $lossTrades, profitFactor: $profitFactor, sharpeRatio: $sharpeRatio, maxDrawdown: $maxDrawdown, averageHoldingTime: $averageHoldingTime, bestWinStreak: $bestWinStreak, worstLossStreak: $worstLossStreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatisticsImpl &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.profitLossRatio, profitLossRatio) ||
                other.profitLossRatio == profitLossRatio) &&
            (identical(other.maxProfit, maxProfit) ||
                other.maxProfit == maxProfit) &&
            (identical(other.maxLoss, maxLoss) || other.maxLoss == maxLoss) &&
            (identical(other.totalProfit, totalProfit) ||
                other.totalProfit == totalProfit) &&
            (identical(other.averageProfit, averageProfit) ||
                other.averageProfit == averageProfit) &&
            (identical(other.averageLoss, averageLoss) ||
                other.averageLoss == averageLoss) &&
            (identical(other.totalTrades, totalTrades) ||
                other.totalTrades == totalTrades) &&
            (identical(other.winTrades, winTrades) ||
                other.winTrades == winTrades) &&
            (identical(other.lossTrades, lossTrades) ||
                other.lossTrades == lossTrades) &&
            (identical(other.profitFactor, profitFactor) ||
                other.profitFactor == profitFactor) &&
            (identical(other.sharpeRatio, sharpeRatio) ||
                other.sharpeRatio == sharpeRatio) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.averageHoldingTime, averageHoldingTime) ||
                other.averageHoldingTime == averageHoldingTime) &&
            (identical(other.bestWinStreak, bestWinStreak) ||
                other.bestWinStreak == bestWinStreak) &&
            (identical(other.worstLossStreak, worstLossStreak) ||
                other.worstLossStreak == worstLossStreak));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      winRate,
      profitLossRatio,
      maxProfit,
      maxLoss,
      totalProfit,
      averageProfit,
      averageLoss,
      totalTrades,
      winTrades,
      lossTrades,
      profitFactor,
      sharpeRatio,
      maxDrawdown,
      averageHoldingTime,
      bestWinStreak,
      worstLossStreak);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatisticsImplCopyWith<_$OrderStatisticsImpl> get copyWith =>
      __$$OrderStatisticsImplCopyWithImpl<_$OrderStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatisticsImplToJson(
      this,
    );
  }
}

abstract class _OrderStatistics implements OrderStatistics {
  const factory _OrderStatistics(
      {required final double winRate,
      required final double profitLossRatio,
      required final double maxProfit,
      required final double maxLoss,
      required final double totalProfit,
      required final double averageProfit,
      required final double averageLoss,
      required final int totalTrades,
      required final int winTrades,
      required final int lossTrades,
      required final double profitFactor,
      required final double sharpeRatio,
      required final double maxDrawdown,
      required final double averageHoldingTime,
      required final double bestWinStreak,
      required final double worstLossStreak}) = _$OrderStatisticsImpl;

  factory _OrderStatistics.fromJson(Map<String, dynamic> json) =
      _$OrderStatisticsImpl.fromJson;

  @override
  double get winRate;
  @override
  double get profitLossRatio;
  @override
  double get maxProfit;
  @override
  double get maxLoss;
  @override
  double get totalProfit;
  @override
  double get averageProfit;
  @override
  double get averageLoss;
  @override
  int get totalTrades;
  @override
  int get winTrades;
  @override
  int get lossTrades;
  @override
  double get profitFactor;
  @override
  double get sharpeRatio;
  @override
  double get maxDrawdown;
  @override
  double get averageHoldingTime;
  @override
  double get bestWinStreak;
  @override
  double get worstLossStreak;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatisticsImplCopyWith<_$OrderStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeRangeStatistics _$TimeRangeStatisticsFromJson(Map<String, dynamic> json) {
  return _TimeRangeStatistics.fromJson(json);
}

/// @nodoc
mixin _$TimeRangeStatistics {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  OrderStatistics get statistics => throw _privateConstructorUsedError;
  List<DailyStatistics> get dailyStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeRangeStatisticsCopyWith<TimeRangeStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeStatisticsCopyWith<$Res> {
  factory $TimeRangeStatisticsCopyWith(
          TimeRangeStatistics value, $Res Function(TimeRangeStatistics) then) =
      _$TimeRangeStatisticsCopyWithImpl<$Res, TimeRangeStatistics>;
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      OrderStatistics statistics,
      List<DailyStatistics> dailyStats});

  $OrderStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$TimeRangeStatisticsCopyWithImpl<$Res, $Val extends TimeRangeStatistics>
    implements $TimeRangeStatisticsCopyWith<$Res> {
  _$TimeRangeStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? statistics = null,
    Object? dailyStats = null,
  }) {
    return _then(_value.copyWith(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as OrderStatistics,
      dailyStats: null == dailyStats
          ? _value.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStatistics>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderStatisticsCopyWith<$Res> get statistics {
    return $OrderStatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimeRangeStatisticsImplCopyWith<$Res>
    implements $TimeRangeStatisticsCopyWith<$Res> {
  factory _$$TimeRangeStatisticsImplCopyWith(_$TimeRangeStatisticsImpl value,
          $Res Function(_$TimeRangeStatisticsImpl) then) =
      __$$TimeRangeStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startTime,
      DateTime endTime,
      OrderStatistics statistics,
      List<DailyStatistics> dailyStats});

  @override
  $OrderStatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$$TimeRangeStatisticsImplCopyWithImpl<$Res>
    extends _$TimeRangeStatisticsCopyWithImpl<$Res, _$TimeRangeStatisticsImpl>
    implements _$$TimeRangeStatisticsImplCopyWith<$Res> {
  __$$TimeRangeStatisticsImplCopyWithImpl(_$TimeRangeStatisticsImpl _value,
      $Res Function(_$TimeRangeStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? endTime = null,
    Object? statistics = null,
    Object? dailyStats = null,
  }) {
    return _then(_$TimeRangeStatisticsImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statistics: null == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as OrderStatistics,
      dailyStats: null == dailyStats
          ? _value._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStatistics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeRangeStatisticsImpl implements _TimeRangeStatistics {
  const _$TimeRangeStatisticsImpl(
      {required this.startTime,
      required this.endTime,
      required this.statistics,
      required final List<DailyStatistics> dailyStats})
      : _dailyStats = dailyStats;

  factory _$TimeRangeStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeRangeStatisticsImplFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final OrderStatistics statistics;
  final List<DailyStatistics> _dailyStats;
  @override
  List<DailyStatistics> get dailyStats {
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyStats);
  }

  @override
  String toString() {
    return 'TimeRangeStatistics(startTime: $startTime, endTime: $endTime, statistics: $statistics, dailyStats: $dailyStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRangeStatisticsImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality()
                .equals(other._dailyStats, _dailyStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, statistics,
      const DeepCollectionEquality().hash(_dailyStats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRangeStatisticsImplCopyWith<_$TimeRangeStatisticsImpl> get copyWith =>
      __$$TimeRangeStatisticsImplCopyWithImpl<_$TimeRangeStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeRangeStatisticsImplToJson(
      this,
    );
  }
}

abstract class _TimeRangeStatistics implements TimeRangeStatistics {
  const factory _TimeRangeStatistics(
          {required final DateTime startTime,
          required final DateTime endTime,
          required final OrderStatistics statistics,
          required final List<DailyStatistics> dailyStats}) =
      _$TimeRangeStatisticsImpl;

  factory _TimeRangeStatistics.fromJson(Map<String, dynamic> json) =
      _$TimeRangeStatisticsImpl.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  OrderStatistics get statistics;
  @override
  List<DailyStatistics> get dailyStats;
  @override
  @JsonKey(ignore: true)
  _$$TimeRangeStatisticsImplCopyWith<_$TimeRangeStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyStatistics _$DailyStatisticsFromJson(Map<String, dynamic> json) {
  return _DailyStatistics.fromJson(json);
}

/// @nodoc
mixin _$DailyStatistics {
  DateTime get date => throw _privateConstructorUsedError;
  double get profit => throw _privateConstructorUsedError;
  double get profitPercent => throw _privateConstructorUsedError;
  int get trades => throw _privateConstructorUsedError;
  int get winTrades => throw _privateConstructorUsedError;
  double get winRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyStatisticsCopyWith<DailyStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatisticsCopyWith<$Res> {
  factory $DailyStatisticsCopyWith(
          DailyStatistics value, $Res Function(DailyStatistics) then) =
      _$DailyStatisticsCopyWithImpl<$Res, DailyStatistics>;
  @useResult
  $Res call(
      {DateTime date,
      double profit,
      double profitPercent,
      int trades,
      int winTrades,
      double winRate});
}

/// @nodoc
class _$DailyStatisticsCopyWithImpl<$Res, $Val extends DailyStatistics>
    implements $DailyStatisticsCopyWith<$Res> {
  _$DailyStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? trades = null,
    Object? winTrades = null,
    Object? winRate = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      trades: null == trades
          ? _value.trades
          : trades // ignore: cast_nullable_to_non_nullable
              as int,
      winTrades: null == winTrades
          ? _value.winTrades
          : winTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStatisticsImplCopyWith<$Res>
    implements $DailyStatisticsCopyWith<$Res> {
  factory _$$DailyStatisticsImplCopyWith(_$DailyStatisticsImpl value,
          $Res Function(_$DailyStatisticsImpl) then) =
      __$$DailyStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      double profit,
      double profitPercent,
      int trades,
      int winTrades,
      double winRate});
}

/// @nodoc
class __$$DailyStatisticsImplCopyWithImpl<$Res>
    extends _$DailyStatisticsCopyWithImpl<$Res, _$DailyStatisticsImpl>
    implements _$$DailyStatisticsImplCopyWith<$Res> {
  __$$DailyStatisticsImplCopyWithImpl(
      _$DailyStatisticsImpl _value, $Res Function(_$DailyStatisticsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? profit = null,
    Object? profitPercent = null,
    Object? trades = null,
    Object? winTrades = null,
    Object? winRate = null,
  }) {
    return _then(_$DailyStatisticsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profit: null == profit
          ? _value.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      profitPercent: null == profitPercent
          ? _value.profitPercent
          : profitPercent // ignore: cast_nullable_to_non_nullable
              as double,
      trades: null == trades
          ? _value.trades
          : trades // ignore: cast_nullable_to_non_nullable
              as int,
      winTrades: null == winTrades
          ? _value.winTrades
          : winTrades // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: null == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStatisticsImpl implements _DailyStatistics {
  const _$DailyStatisticsImpl(
      {required this.date,
      required this.profit,
      required this.profitPercent,
      required this.trades,
      required this.winTrades,
      required this.winRate});

  factory _$DailyStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatisticsImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double profit;
  @override
  final double profitPercent;
  @override
  final int trades;
  @override
  final int winTrades;
  @override
  final double winRate;

  @override
  String toString() {
    return 'DailyStatistics(date: $date, profit: $profit, profitPercent: $profitPercent, trades: $trades, winTrades: $winTrades, winRate: $winRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatisticsImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.profitPercent, profitPercent) ||
                other.profitPercent == profitPercent) &&
            (identical(other.trades, trades) || other.trades == trades) &&
            (identical(other.winTrades, winTrades) ||
                other.winTrades == winTrades) &&
            (identical(other.winRate, winRate) || other.winRate == winRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, profit, profitPercent, trades, winTrades, winRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatisticsImplCopyWith<_$DailyStatisticsImpl> get copyWith =>
      __$$DailyStatisticsImplCopyWithImpl<_$DailyStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStatisticsImplToJson(
      this,
    );
  }
}

abstract class _DailyStatistics implements DailyStatistics {
  const factory _DailyStatistics(
      {required final DateTime date,
      required final double profit,
      required final double profitPercent,
      required final int trades,
      required final int winTrades,
      required final double winRate}) = _$DailyStatisticsImpl;

  factory _DailyStatistics.fromJson(Map<String, dynamic> json) =
      _$DailyStatisticsImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get profit;
  @override
  double get profitPercent;
  @override
  int get trades;
  @override
  int get winTrades;
  @override
  double get winRate;
  @override
  @JsonKey(ignore: true)
  _$$DailyStatisticsImplCopyWith<_$DailyStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
