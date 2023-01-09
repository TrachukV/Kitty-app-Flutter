// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpensesModel _$$_ExpensesModelFromJson(Map<String, dynamic> json) =>
    _$_ExpensesModel(
      totalExpenses: json['totalExpenses'] as int,
      currentMonth: json['currentMonth'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_ExpensesModelToJson(_$_ExpensesModel instance) =>
    <String, dynamic>{
      'totalExpenses': instance.totalExpenses,
      'currentMonth': instance.currentMonth,
      'id': instance.id,
    };
