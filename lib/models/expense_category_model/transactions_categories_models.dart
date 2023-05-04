import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty_app/models/icon_model/icon_model.dart';

part 'transactions_categories_models.freezed.dart';

part 'transactions_categories_models.g.dart';

@freezed
class TransactionsCategoriesModel with _$TransactionsCategoriesModel {
  @JsonSerializable(explicitToJson: true)
  const factory TransactionsCategoriesModel({
    required int categoryId,
    required String title,
    @Default(0.0) double totalAmount,
    @Default(0) int amount,
    required IconModel icon,
    required String type,
    required int orderNum,
  }) = _TransactionsCategoriesModel;

  factory TransactionsCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionsCategoriesModelFromJson(json);
}
