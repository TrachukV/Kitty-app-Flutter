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
      timeStamp: json['timeStamp'] as int,
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StatisticsModelToJson(_$_StatisticsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'counterTransactions': instance.counterTransactions,
      'totalAmount': instance.totalAmount,
      'timeStamp': instance.timeStamp,
      'icon': instance.icon.toJson(),
    };
