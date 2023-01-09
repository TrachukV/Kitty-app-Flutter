// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceModel _$$_BalanceModelFromJson(Map<String, dynamic> json) =>
    _$_BalanceModel(
      actualBalance: json['actualBalance'] as int,
      currentMonth: json['currentMonth'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_BalanceModelToJson(_$_BalanceModel instance) =>
    <String, dynamic>{
      'actualBalance': instance.actualBalance,
      'currentMonth': instance.currentMonth,
      'id': instance.id,
    };
