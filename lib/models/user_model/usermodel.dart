
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usermodel.freezed.dart';
part 'usermodel.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String userName,
    required String eMail,
    required String pathToAvatar,
    required int id,
}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

