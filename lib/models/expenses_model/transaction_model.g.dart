// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionModel _$$_TransactionModelFromJson(Map<String, dynamic> json) =>
    _$_TransactionModel(
      expenseId: json['expenseId'] as int,
      amount: json['amount'] as int,
      currentMonth: DateTime.parse(json['currentMonth'] as String),
      timeStamp: json['timeStamp'] as int,
      description: json['description'] as String,
      categoryId: json['categoryId'] as int,
    );

Map<String, dynamic> _$$_TransactionModelToJson(_$_TransactionModel instance) =>
    <String, dynamic>{
      'expenseId': instance.expenseId,
      'amount': instance.amount,
      'currentMonth': instance.currentMonth.toIso8601String(),
      'timeStamp': instance.timeStamp,
      'description': instance.description,
      'categoryId': instance.categoryId,
    };
