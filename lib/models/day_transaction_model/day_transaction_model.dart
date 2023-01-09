
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_transaction_model.freezed.dart';
part 'day_transaction_model.g.dart';

@freezed
class DayTransactionModel with _$DayTransactionModel {
  const factory DayTransactionModel({
    required String transactionDate,
  }) = _DayTransactionModel;

  factory DayTransactionModel.fromJson(Map<String, dynamic> json) => _$DayTransactionModelFromJson(json);
}