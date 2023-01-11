
import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_model.freezed.dart';
part 'income_model.g.dart';

@freezed
class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    required int income,
    required String currentMonth,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) => _$IncomeModelFromJson(json);
}

