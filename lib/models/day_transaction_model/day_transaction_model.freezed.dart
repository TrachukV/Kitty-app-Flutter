// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DayTransactionModel _$DayTransactionModelFromJson(Map<String, dynamic> json) {
  return _DayTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$DayTransactionModel {
  String get transactionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayTransactionModelCopyWith<DayTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayTransactionModelCopyWith<$Res> {
  factory $DayTransactionModelCopyWith(
          DayTransactionModel value, $Res Function(DayTransactionModel) then) =
      _$DayTransactionModelCopyWithImpl<$Res, DayTransactionModel>;
  @useResult
  $Res call({String transactionDate});
}

/// @nodoc
class _$DayTransactionModelCopyWithImpl<$Res, $Val extends DayTransactionModel>
    implements $DayTransactionModelCopyWith<$Res> {
  _$DayTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayTransactionModelCopyWith<$Res>
    implements $DayTransactionModelCopyWith<$Res> {
  factory _$$_DayTransactionModelCopyWith(_$_DayTransactionModel value,
          $Res Function(_$_DayTransactionModel) then) =
      __$$_DayTransactionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String transactionDate});
}

/// @nodoc
class __$$_DayTransactionModelCopyWithImpl<$Res>
    extends _$DayTransactionModelCopyWithImpl<$Res, _$_DayTransactionModel>
    implements _$$_DayTransactionModelCopyWith<$Res> {
  __$$_DayTransactionModelCopyWithImpl(_$_DayTransactionModel _value,
      $Res Function(_$_DayTransactionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
  }) {
    return _then(_$_DayTransactionModel(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DayTransactionModel implements _DayTransactionModel {
  const _$_DayTransactionModel({required this.transactionDate});

  factory _$_DayTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$$_DayTransactionModelFromJson(json);

  @override
  final String transactionDate;

  @override
  String toString() {
    return 'DayTransactionModel(transactionDate: $transactionDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayTransactionModel &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayTransactionModelCopyWith<_$_DayTransactionModel> get copyWith =>
      __$$_DayTransactionModelCopyWithImpl<_$_DayTransactionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayTransactionModelToJson(
      this,
    );
  }
}

abstract class _DayTransactionModel implements DayTransactionModel {
  const factory _DayTransactionModel({required final String transactionDate}) =
      _$_DayTransactionModel;

  factory _DayTransactionModel.fromJson(Map<String, dynamic> json) =
      _$_DayTransactionModel.fromJson;

  @override
  String get transactionDate;
  @override
  @JsonKey(ignore: true)
  _$$_DayTransactionModelCopyWith<_$_DayTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
