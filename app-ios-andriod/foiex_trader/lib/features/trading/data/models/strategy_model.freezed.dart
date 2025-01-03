// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strategy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StrategyModel _$StrategyModelFromJson(Map<String, dynamic> json) {
  return _StrategyModel.fromJson(json);
}

/// @nodoc
mixin _$StrategyModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get returns => throw _privateConstructorUsedError;
  double get sharpeRatio => throw _privateConstructorUsedError;
  double get maxDrawdown => throw _privateConstructorUsedError;
  int get followersCount => throw _privateConstructorUsedError;
  List<String> get supportedMarkets => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrategyModelCopyWith<StrategyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrategyModelCopyWith<$Res> {
  factory $StrategyModelCopyWith(
          StrategyModel value, $Res Function(StrategyModel) then) =
      _$StrategyModelCopyWithImpl<$Res, StrategyModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double returns,
      double sharpeRatio,
      double maxDrawdown,
      int followersCount,
      List<String> supportedMarkets,
      bool isFollowing});
}

/// @nodoc
class _$StrategyModelCopyWithImpl<$Res, $Val extends StrategyModel>
    implements $StrategyModelCopyWith<$Res> {
  _$StrategyModelCopyWithImpl(this._value, this._then);

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
    Object? returns = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? followersCount = null,
    Object? supportedMarkets = null,
    Object? isFollowing = null,
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
      returns: null == returns
          ? _value.returns
          : returns // ignore: cast_nullable_to_non_nullable
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
      supportedMarkets: null == supportedMarkets
          ? _value.supportedMarkets
          : supportedMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrategyModelImplCopyWith<$Res>
    implements $StrategyModelCopyWith<$Res> {
  factory _$$StrategyModelImplCopyWith(
          _$StrategyModelImpl value, $Res Function(_$StrategyModelImpl) then) =
      __$$StrategyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double returns,
      double sharpeRatio,
      double maxDrawdown,
      int followersCount,
      List<String> supportedMarkets,
      bool isFollowing});
}

/// @nodoc
class __$$StrategyModelImplCopyWithImpl<$Res>
    extends _$StrategyModelCopyWithImpl<$Res, _$StrategyModelImpl>
    implements _$$StrategyModelImplCopyWith<$Res> {
  __$$StrategyModelImplCopyWithImpl(
      _$StrategyModelImpl _value, $Res Function(_$StrategyModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? returns = null,
    Object? sharpeRatio = null,
    Object? maxDrawdown = null,
    Object? followersCount = null,
    Object? supportedMarkets = null,
    Object? isFollowing = null,
  }) {
    return _then(_$StrategyModelImpl(
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
      returns: null == returns
          ? _value.returns
          : returns // ignore: cast_nullable_to_non_nullable
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
      supportedMarkets: null == supportedMarkets
          ? _value._supportedMarkets
          : supportedMarkets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrategyModelImpl implements _StrategyModel {
  const _$StrategyModelImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.returns,
      required this.sharpeRatio,
      required this.maxDrawdown,
      required this.followersCount,
      required final List<String> supportedMarkets,
      this.isFollowing = false})
      : _supportedMarkets = supportedMarkets;

  factory _$StrategyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrategyModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double returns;
  @override
  final double sharpeRatio;
  @override
  final double maxDrawdown;
  @override
  final int followersCount;
  final List<String> _supportedMarkets;
  @override
  List<String> get supportedMarkets {
    if (_supportedMarkets is EqualUnmodifiableListView)
      return _supportedMarkets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedMarkets);
  }

  @override
  @JsonKey()
  final bool isFollowing;

  @override
  String toString() {
    return 'StrategyModel(id: $id, name: $name, description: $description, returns: $returns, sharpeRatio: $sharpeRatio, maxDrawdown: $maxDrawdown, followersCount: $followersCount, supportedMarkets: $supportedMarkets, isFollowing: $isFollowing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrategyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.returns, returns) || other.returns == returns) &&
            (identical(other.sharpeRatio, sharpeRatio) ||
                other.sharpeRatio == sharpeRatio) &&
            (identical(other.maxDrawdown, maxDrawdown) ||
                other.maxDrawdown == maxDrawdown) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            const DeepCollectionEquality()
                .equals(other._supportedMarkets, _supportedMarkets) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      returns,
      sharpeRatio,
      maxDrawdown,
      followersCount,
      const DeepCollectionEquality().hash(_supportedMarkets),
      isFollowing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrategyModelImplCopyWith<_$StrategyModelImpl> get copyWith =>
      __$$StrategyModelImplCopyWithImpl<_$StrategyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrategyModelImplToJson(
      this,
    );
  }
}

abstract class _StrategyModel implements StrategyModel {
  const factory _StrategyModel(
      {required final String id,
      required final String name,
      required final String description,
      required final double returns,
      required final double sharpeRatio,
      required final double maxDrawdown,
      required final int followersCount,
      required final List<String> supportedMarkets,
      final bool isFollowing}) = _$StrategyModelImpl;

  factory _StrategyModel.fromJson(Map<String, dynamic> json) =
      _$StrategyModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get returns;
  @override
  double get sharpeRatio;
  @override
  double get maxDrawdown;
  @override
  int get followersCount;
  @override
  List<String> get supportedMarkets;
  @override
  bool get isFollowing;
  @override
  @JsonKey(ignore: true)
  _$$StrategyModelImplCopyWith<_$StrategyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
