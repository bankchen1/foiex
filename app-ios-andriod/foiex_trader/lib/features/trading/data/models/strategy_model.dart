import 'package:freezed_annotation/freezed_annotation.dart';

part 'strategy_model.freezed.dart';
part 'strategy_model.g.dart';

@freezed
class StrategyModel with _$StrategyModel {
  const factory StrategyModel({
    required String id,
    required String name,
    required String description,
    required double returns,
    required double sharpeRatio,
    required double maxDrawdown,
    required int followersCount,
    required List<String> supportedMarkets,
    @Default(false) bool isFollowing,
  }) = _StrategyModel;

  factory StrategyModel.fromJson(Map<String, dynamic> json) =>
      _$StrategyModelFromJson(json);
}
