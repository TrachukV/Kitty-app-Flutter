import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';

part 'expense_category.freezed.dart';

part 'expense_category.g.dart';

@freezed
class ExpenseCategoryModel with _$ExpenseCategoryModel {
  @JsonSerializable(explicitToJson: true)
  const factory ExpenseCategoryModel({
    required String title,
    @Default(0.0) double totalAmount,
    @Default(0) int entries,
    required IconModel icon,
  }) = _ExpenseCategory;

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) => _$ExpenseCategoryModelFromJson(json);
}
