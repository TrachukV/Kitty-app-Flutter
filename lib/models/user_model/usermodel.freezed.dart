// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usermodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get userName => throw _privateConstructorUsedError;
  String get eMail => throw _privateConstructorUsedError;
  String get pathToAvatar => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  bool get biometrics => throw _privateConstructorUsedError;
  String get pinCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String userName,
      String eMail,
      String pathToAvatar,
      int id,
      bool biometrics,
      String pinCode});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? eMail = null,
    Object? pathToAvatar = null,
    Object? id = null,
    Object? biometrics = null,
    Object? pinCode = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      eMail: null == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String,
      pathToAvatar: null == pathToAvatar
          ? _value.pathToAvatar
          : pathToAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      biometrics: null == biometrics
          ? _value.biometrics
          : biometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String eMail,
      String pathToAvatar,
      int id,
      bool biometrics,
      String pinCode});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? eMail = null,
    Object? pathToAvatar = null,
    Object? id = null,
    Object? biometrics = null,
    Object? pinCode = null,
  }) {
    return _then(_$_UserModel(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      eMail: null == eMail
          ? _value.eMail
          : eMail // ignore: cast_nullable_to_non_nullable
              as String,
      pathToAvatar: null == pathToAvatar
          ? _value.pathToAvatar
          : pathToAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      biometrics: null == biometrics
          ? _value.biometrics
          : biometrics // ignore: cast_nullable_to_non_nullable
              as bool,
      pinCode: null == pinCode
          ? _value.pinCode
          : pinCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  const _$_UserModel(
      {required this.userName,
      required this.eMail,
      required this.pathToAvatar,
      required this.id,
      required this.biometrics,
      required this.pinCode});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  final String userName;
  @override
  final String eMail;
  @override
  final String pathToAvatar;
  @override
  final int id;
  @override
  final bool biometrics;
  @override
  final String pinCode;

  @override
  String toString() {
    return 'UserModel(userName: $userName, eMail: $eMail, pathToAvatar: $pathToAvatar, id: $id, biometrics: $biometrics, pinCode: $pinCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.eMail, eMail) || other.eMail == eMail) &&
            (identical(other.pathToAvatar, pathToAvatar) ||
                other.pathToAvatar == pathToAvatar) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.biometrics, biometrics) ||
                other.biometrics == biometrics) &&
            (identical(other.pinCode, pinCode) || other.pinCode == pinCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userName, eMail, pathToAvatar, id, biometrics, pinCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String userName,
      required final String eMail,
      required final String pathToAvatar,
      required final int id,
      required final bool biometrics,
      required final String pinCode}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  String get userName;
  @override
  String get eMail;
  @override
  String get pathToAvatar;
  @override
  int get id;
  @override
  bool get biometrics;
  @override
  String get pinCode;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
