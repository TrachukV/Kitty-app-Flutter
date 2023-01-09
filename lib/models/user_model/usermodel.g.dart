// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userName: json['userName'] as String,
      eMail: json['eMail'] as String,
      pathToAvatar: json['pathToAvatar'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'eMail': instance.eMail,
      'pathToAvatar': instance.pathToAvatar,
      'id': instance.id,
    };
