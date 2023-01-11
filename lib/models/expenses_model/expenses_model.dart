
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expenses_model.freezed.dart';
part 'expenses_model.g.dart';

@freezed
class ExpensesModel with _$ExpensesModel {
  const factory ExpensesModel({
    required int totalExpenses,
    required String currentMonth,
  }) = _ExpensesModel;

  factory ExpensesModel.fromJson(Map<String, dynamic> json) => _$ExpensesModelFromJson(json);
}
