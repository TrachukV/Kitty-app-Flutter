// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseCategory _$$_ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    _$_ExpenseCategory(
      title: json['title'] as String,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      entries: json['entries'] as int? ?? 0,
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ExpenseCategoryToJson(_$_ExpenseCategory instance) =>
    <String, dynamic>{
      'title': instance.title,
      'totalAmount': instance.totalAmount,
      'entries': instance.entries,
      'icon': instance.icon.toJson(),
    };