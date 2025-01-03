// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'market_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarketTicker _$MarketTickerFromJson(Map<String, dynamic> json) {
  return _MarketTicker.fromJson(json);
}

/// @nodoc
mixin _$MarketTicker {
  String get symbol => throw _privateConstructorUsedError;
  double get lastPrice => throw _privateConstructorUsedError;
  double get high24h => throw _privateConstructorUsedError;
  double get low24h => throw _privateConstructorUsedError;
  double get volume24h => throw _privateConstructorUsedError;
  double get priceChangePercent => throw _privateConstructorUsedError;
  String? get marketType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketTickerCopyWith<MarketTicker> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketTickerCopyWith<$Res> {
  factory $MarketTickerCopyWith(
          MarketTicker value, $Res Function(MarketTicker) then) =
      _$MarketTickerCopyWithImpl<$Res, MarketTicker>;
  @useResult
  $Res call(
      {String symbol,
      double lastPrice,
      double high24h,
      double low24h,
      double volume24h,
      double priceChangePercent,
      String? marketType});
}

/// @nodoc
class _$MarketTickerCopyWithImpl<$Res, $Val extends MarketTicker>
    implements $MarketTickerCopyWith<$Res> {
  _$MarketTickerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? lastPrice = null,
    Object? high24h = null,
    Object? low24h = null,
    Object? volume24h = null,
    Object? priceChangePercent = null,
    Object? marketType = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as double,
      high24h: null == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as double,
      low24h: null == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as double,
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePercent: null == priceChangePercent
          ? _value.priceChangePercent
          : priceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      marketType: freezed == marketType
          ? _value.marketType
          : marketType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketTickerImplCopyWith<$Res>
    implements $MarketTickerCopyWith<$Res> {
  factory _$$MarketTickerImplCopyWith(
          _$MarketTickerImpl value, $Res Function(_$MarketTickerImpl) then) =
      __$$MarketTickerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      double lastPrice,
      double high24h,
      double low24h,
      double volume24h,
      double priceChangePercent,
      String? marketType});
}

/// @nodoc
class __$$MarketTickerImplCopyWithImpl<$Res>
    extends _$MarketTickerCopyWithImpl<$Res, _$MarketTickerImpl>
    implements _$$MarketTickerImplCopyWith<$Res> {
  __$$MarketTickerImplCopyWithImpl(
      _$MarketTickerImpl _value, $Res Function(_$MarketTickerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? lastPrice = null,
    Object? high24h = null,
    Object? low24h = null,
    Object? volume24h = null,
    Object? priceChangePercent = null,
    Object? marketType = freezed,
  }) {
    return _then(_$MarketTickerImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      lastPrice: null == lastPrice
          ? _value.lastPrice
          : lastPrice // ignore: cast_nullable_to_non_nullable
              as double,
      high24h: null == high24h
          ? _value.high24h
          : high24h // ignore: cast_nullable_to_non_nullable
              as double,
      low24h: null == low24h
          ? _value.low24h
          : low24h // ignore: cast_nullable_to_non_nullable
              as double,
      volume24h: null == volume24h
          ? _value.volume24h
          : volume24h // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePercent: null == priceChangePercent
          ? _value.priceChangePercent
          : priceChangePercent // ignore: cast_nullable_to_non_nullable
              as double,
      marketType: freezed == marketType
          ? _value.marketType
          : marketType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketTickerImpl implements _MarketTicker {
  const _$MarketTickerImpl(
      {required this.symbol,
      required this.lastPrice,
      required this.high24h,
      required this.low24h,
      required this.volume24h,
      required this.priceChangePercent,
      this.marketType});

  factory _$MarketTickerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketTickerImplFromJson(json);

  @override
  final String symbol;
  @override
  final double lastPrice;
  @override
  final double high24h;
  @override
  final double low24h;
  @override
  final double volume24h;
  @override
  final double priceChangePercent;
  @override
  final String? marketType;

  @override
  String toString() {
    return 'MarketTicker(symbol: $symbol, lastPrice: $lastPrice, high24h: $high24h, low24h: $low24h, volume24h: $volume24h, priceChangePercent: $priceChangePercent, marketType: $marketType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketTickerImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.lastPrice, lastPrice) ||
                other.lastPrice == lastPrice) &&
            (identical(other.high24h, high24h) || other.high24h == high24h) &&
            (identical(other.low24h, low24h) || other.low24h == low24h) &&
            (identical(other.volume24h, volume24h) ||
                other.volume24h == volume24h) &&
            (identical(other.priceChangePercent, priceChangePercent) ||
                other.priceChangePercent == priceChangePercent) &&
            (identical(other.marketType, marketType) ||
                other.marketType == marketType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, symbol, lastPrice, high24h,
      low24h, volume24h, priceChangePercent, marketType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketTickerImplCopyWith<_$MarketTickerImpl> get copyWith =>
      __$$MarketTickerImplCopyWithImpl<_$MarketTickerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketTickerImplToJson(
      this,
    );
  }
}

abstract class _MarketTicker implements MarketTicker {
  const factory _MarketTicker(
      {required final String symbol,
      required final double lastPrice,
      required final double high24h,
      required final double low24h,
      required final double volume24h,
      required final double priceChangePercent,
      final String? marketType}) = _$MarketTickerImpl;

  factory _MarketTicker.fromJson(Map<String, dynamic> json) =
      _$MarketTickerImpl.fromJson;

  @override
  String get symbol;
  @override
  double get lastPrice;
  @override
  double get high24h;
  @override
  double get low24h;
  @override
  double get volume24h;
  @override
  double get priceChangePercent;
  @override
  String? get marketType;
  @override
  @JsonKey(ignore: true)
  _$$MarketTickerImplCopyWith<_$MarketTickerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarketDepth _$MarketDepthFromJson(Map<String, dynamic> json) {
  return _MarketDepth.fromJson(json);
}

/// @nodoc
mixin _$MarketDepth {
  String get symbol => throw _privateConstructorUsedError;
  List<List<double>> get bids => throw _privateConstructorUsedError;
  List<List<double>> get asks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketDepthCopyWith<MarketDepth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketDepthCopyWith<$Res> {
  factory $MarketDepthCopyWith(
          MarketDepth value, $Res Function(MarketDepth) then) =
      _$MarketDepthCopyWithImpl<$Res, MarketDepth>;
  @useResult
  $Res call({String symbol, List<List<double>> bids, List<List<double>> asks});
}

/// @nodoc
class _$MarketDepthCopyWithImpl<$Res, $Val extends MarketDepth>
    implements $MarketDepthCopyWith<$Res> {
  _$MarketDepthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? bids = null,
    Object? asks = null,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      bids: null == bids
          ? _value.bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      asks: null == asks
          ? _value.asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarketDepthImplCopyWith<$Res>
    implements $MarketDepthCopyWith<$Res> {
  factory _$$MarketDepthImplCopyWith(
          _$MarketDepthImpl value, $Res Function(_$MarketDepthImpl) then) =
      __$$MarketDepthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String symbol, List<List<double>> bids, List<List<double>> asks});
}

/// @nodoc
class __$$MarketDepthImplCopyWithImpl<$Res>
    extends _$MarketDepthCopyWithImpl<$Res, _$MarketDepthImpl>
    implements _$$MarketDepthImplCopyWith<$Res> {
  __$$MarketDepthImplCopyWithImpl(
      _$MarketDepthImpl _value, $Res Function(_$MarketDepthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? bids = null,
    Object? asks = null,
  }) {
    return _then(_$MarketDepthImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      bids: null == bids
          ? _value._bids
          : bids // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      asks: null == asks
          ? _value._asks
          : asks // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarketDepthImpl implements _MarketDepth {
  const _$MarketDepthImpl(
      {required this.symbol,
      required final List<List<double>> bids,
      required final List<List<double>> asks})
      : _bids = bids,
        _asks = asks;

  factory _$MarketDepthImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarketDepthImplFromJson(json);

  @override
  final String symbol;
  final List<List<double>> _bids;
  @override
  List<List<double>> get bids {
    if (_bids is EqualUnmodifiableListView) return _bids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bids);
  }

  final List<List<double>> _asks;
  @override
  List<List<double>> get asks {
    if (_asks is EqualUnmodifiableListView) return _asks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_asks);
  }

  @override
  String toString() {
    return 'MarketDepth(symbol: $symbol, bids: $bids, asks: $asks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarketDepthImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            const DeepCollectionEquality().equals(other._bids, _bids) &&
            const DeepCollectionEquality().equals(other._asks, _asks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      symbol,
      const DeepCollectionEquality().hash(_bids),
      const DeepCollectionEquality().hash(_asks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarketDepthImplCopyWith<_$MarketDepthImpl> get copyWith =>
      __$$MarketDepthImplCopyWithImpl<_$MarketDepthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarketDepthImplToJson(
      this,
    );
  }
}

abstract class _MarketDepth implements MarketDepth {
  const factory _MarketDepth(
      {required final String symbol,
      required final List<List<double>> bids,
      required final List<List<double>> asks}) = _$MarketDepthImpl;

  factory _MarketDepth.fromJson(Map<String, dynamic> json) =
      _$MarketDepthImpl.fromJson;

  @override
  String get symbol;
  @override
  List<List<double>> get bids;
  @override
  List<List<double>> get asks;
  @override
  @JsonKey(ignore: true)
  _$$MarketDepthImplCopyWith<_$MarketDepthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Kline _$KlineFromJson(Map<String, dynamic> json) {
  return _Kline.fromJson(json);
}

/// @nodoc
mixin _$Kline {
  int get timestamp => throw _privateConstructorUsedError;
  double get open => throw _privateConstructorUsedError;
  double get high => throw _privateConstructorUsedError;
  double get low => throw _privateConstructorUsedError;
  double get close => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KlineCopyWith<Kline> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KlineCopyWith<$Res> {
  factory $KlineCopyWith(Kline value, $Res Function(Kline) then) =
      _$KlineCopyWithImpl<$Res, Kline>;
  @useResult
  $Res call(
      {int timestamp,
      double open,
      double high,
      double low,
      double close,
      double volume});
}

/// @nodoc
class _$KlineCopyWithImpl<$Res, $Val extends Kline>
    implements $KlineCopyWith<$Res> {
  _$KlineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KlineImplCopyWith<$Res> implements $KlineCopyWith<$Res> {
  factory _$$KlineImplCopyWith(
          _$KlineImpl value, $Res Function(_$KlineImpl) then) =
      __$$KlineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp,
      double open,
      double high,
      double low,
      double close,
      double volume});
}

/// @nodoc
class __$$KlineImplCopyWithImpl<$Res>
    extends _$KlineCopyWithImpl<$Res, _$KlineImpl>
    implements _$$KlineImplCopyWith<$Res> {
  __$$KlineImplCopyWithImpl(
      _$KlineImpl _value, $Res Function(_$KlineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$KlineImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KlineImpl implements _Kline {
  const _$KlineImpl(
      {required this.timestamp,
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  factory _$KlineImpl.fromJson(Map<String, dynamic> json) =>
      _$$KlineImplFromJson(json);

  @override
  final int timestamp;
  @override
  final double open;
  @override
  final double high;
  @override
  final double low;
  @override
  final double close;
  @override
  final double volume;

  @override
  String toString() {
    return 'Kline(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KlineImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, timestamp, open, high, low, close, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KlineImplCopyWith<_$KlineImpl> get copyWith =>
      __$$KlineImplCopyWithImpl<_$KlineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KlineImplToJson(
      this,
    );
  }
}

abstract class _Kline implements Kline {
  const factory _Kline(
      {required final int timestamp,
      required final double open,
      required final double high,
      required final double low,
      required final double close,
      required final double volume}) = _$KlineImpl;

  factory _Kline.fromJson(Map<String, dynamic> json) = _$KlineImpl.fromJson;

  @override
  int get timestamp;
  @override
  double get open;
  @override
  double get high;
  @override
  double get low;
  @override
  double get close;
  @override
  double get volume;
  @override
  @JsonKey(ignore: true)
  _$$KlineImplCopyWith<_$KlineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
