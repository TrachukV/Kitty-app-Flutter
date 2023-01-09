
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_model.freezed.dart';
part 'balance_model.g.dart';

@freezed
class BalanceModel with _$BalanceModel {
  const factory BalanceModel({
    required int actualBalance,
    required String currentMonth,
    required int id,
}) = _BalanceModel;


  factory BalanceModel.fromJson(Map<String, dynamic> json) => _$BalanceModelFromJson(json);
}