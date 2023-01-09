// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'balance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceModel _$BalanceModelFromJson(Map<String, dynamic> json) {
  return _BalanceModel.fromJson(json);
}

/// @nodoc
mixin _$BalanceModel {
  int get actualBalance => throw _privateConstructorUsedError;
  String get currentMonth => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceModelCopyWith<BalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceModelCopyWith<$Res> {
  factory $BalanceModelCopyWith(
          BalanceModel value, $Res Function(BalanceModel) then) =
      _$BalanceModelCopyWithImpl<$Res, BalanceModel>;
  @useResult
  $Res call({int actualBalance, String currentMonth, int id});
}

/// @nodoc
class _$BalanceModelCopyWithImpl<$Res, $Val extends BalanceModel>
    implements $BalanceModelCopyWith<$Res> {
  _$BalanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualBalance = null,
    Object? currentMonth = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      actualBalance: null == actualBalance
          ? _value.actualBalance
          : actualBalance // ignore: cast_nullable_to_non_nullable
              as int,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BalanceModelCopyWith<$Res>
    implements $BalanceModelCopyWith<$Res> {
  factory _$$_BalanceModelCopyWith(
          _$_BalanceModel value, $Res Function(_$_BalanceModel) then) =
      __$$_BalanceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int actualBalance, String currentMonth, int id});
}

/// @nodoc
class __$$_BalanceModelCopyWithImpl<$Res>
    extends _$BalanceModelCopyWithImpl<$Res, _$_BalanceModel>
    implements _$$_BalanceModelCopyWith<$Res> {
  __$$_BalanceModelCopyWithImpl(
      _$_BalanceModel _value, $Res Function(_$_BalanceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actualBalance = null,
    Object? currentMonth = null,
    Object? id = null,
  }) {
    return _then(_$_BalanceModel(
      actualBalance: null == actualBalance
          ? _value.actualBalance
          : actualBalance // ignore: cast_nullable_to_non_nullable
              as int,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceModel implements _BalanceModel {
  const _$_BalanceModel(
      {required this.actualBalance,
      required this.currentMonth,
      required this.id});

  factory _$_BalanceModel.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceModelFromJson(json);

  @override
  final int actualBalance;
  @override
  final String currentMonth;
  @override
  final int id;

  @override
  String toString() {
    return 'BalanceModel(actualBalance: $actualBalance, currentMonth: $currentMonth, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceModel &&
            (identical(other.actualBalance, actualBalance) ||
                other.actualBalance == actualBalance) &&
            (identical(other.currentMonth, currentMonth) ||
                other.currentMonth == currentMonth) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, actualBalance, currentMonth, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BalanceModelCopyWith<_$_BalanceModel> get copyWith =>
      __$$_BalanceModelCopyWithImpl<_$_BalanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceModelToJson(
      this,
    );
  }
}

abstract class _BalanceModel implements BalanceModel {
  const factory _BalanceModel(
      {required final int actualBalance,
      required final String currentMonth,
      required final int id}) = _$_BalanceModel;

  factory _BalanceModel.fromJson(Map<String, dynamic> json) =
      _$_BalanceModel.fromJson;

  @override
  int get actualBalance;
  @override
  String get currentMonth;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceModelCopyWith<_$_BalanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
