
import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_model.freezed.dart';
part 'icon_model.g.dart';

@freezed
class IconModel with _$IconModel {
  const factory IconModel({
    required String color,
    required String pathToIcon,
}) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) => _$IconModelFromJson(json);
}