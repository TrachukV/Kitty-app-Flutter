
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';

part 'income_category_model.freezed.dart';
part 'income_category_model.g.dart';
@freezed
class IncomeCategoryModel with _$IncomeCategoryModel{
  @JsonSerializable(explicitToJson: true)
  const factory IncomeCategoryModel({
    required String title,
    @Default(0.0) double totalAmount,
    @Default(0) int entries,
    required IconModel icon,
  }) = _IncomeCategory;
  factory IncomeCategoryModel.fromJson(Map<String, dynamic> json)=> _$IncomeCategoryModelFromJson(json);
}
