import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';

part 'statistics_model.freezed.dart';

part 'statistics_model.g.dart';

@freezed
class StatisticsModel with _$StatisticsModel {
  @JsonSerializable(explicitToJson: true)
  const factory StatisticsModel({
    required String title,
    required int counterTransactions,
    required int totalAmount,
    required double percentage,
    required IconModel icon,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$StatisticsModelFromJson(json);
}
