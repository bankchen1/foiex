// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrategyModelImpl _$$StrategyModelImplFromJson(Map<String, dynamic> json) =>
    _$StrategyModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      returns: (json['returns'] as num).toDouble(),
      sharpeRatio: (json['sharpeRatio'] as num).toDouble(),
      maxDrawdown: (json['maxDrawdown'] as num).toDouble(),
      followersCount: (json['followersCount'] as num).toInt(),
      supportedMarkets: (json['supportedMarkets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isFollowing: json['isFollowing'] as bool? ?? false,
    );

Map<String, dynamic> _$$StrategyModelImplToJson(_$StrategyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'returns': instance.returns,
      'sharpeRatio': instance.sharpeRatio,
      'maxDrawdown': instance.maxDrawdown,
      'followersCount': instance.followersCount,
      'supportedMarkets': instance.supportedMarkets,
      'isFollowing': instance.isFollowing,
    };
