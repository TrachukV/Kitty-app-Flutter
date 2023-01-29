// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_categories_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionsCategoriesModel _$$_TransactionsCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionsCategoriesModel(
      categoryId: json['categoryId'] as int,
      title: json['title'] as String,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      amount: json['amount'] as int? ?? 0,
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
      type: json['type'] as String,
      orderNum: json['orderNum'] as int,
    );

Map<String, dynamic> _$$_TransactionsCategoriesModelToJson(
        _$_TransactionsCategoriesModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'title': instance.title,
      'totalAmount': instance.totalAmount,
      'amount': instance.amount,
      'icon': instance.icon.toJson(),
      'type': instance.type,
      'orderNum': instance.orderNum,
    };
