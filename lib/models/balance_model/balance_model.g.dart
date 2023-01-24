// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceModel _$$_BalanceModelFromJson(Map<String, dynamic> json) =>
    _$_BalanceModel(
      income: json['income'] as int,
      expenses: json['expenses'] as int,
      actualBalance: json['actualBalance'] as int,
    );

Map<String, dynamic> _$$_BalanceModelToJson(_$_BalanceModel instance) =>
    <String, dynamic>{
      'income': instance.income,
      'expenses': instance.expenses,
      'actualBalance': instance.actualBalance,
    };
