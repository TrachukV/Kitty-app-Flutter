// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StatisticsModel _$$_StatisticsModelFromJson(Map<String, dynamic> json) =>
    _$_StatisticsModel(
      title: json['title'] as String,
      counterTransactions: json['counterTransactions'] as int,
      totalAmount: json['totalAmount'] as int,
      percentage: (json['percentage'] as num).toDouble(),
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatisticsModelToJson(_$_StatisticsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'counterTransactions': instance.counterTransactions,
      'totalAmount': instance.totalAmount,
      'percentage': instance.percentage,
      'icon': instance.icon.toJson(),
    };
