// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) {
  return _IncomeModel.fromJson(json);
}

/// @nodoc
mixin _$IncomeModel {
  int get income => throw _privateConstructorUsedError;
  String get currentMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeModelCopyWith<IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeModelCopyWith<$Res> {
  factory $IncomeModelCopyWith(
          IncomeModel value, $Res Function(IncomeModel) then) =
      _$IncomeModelCopyWithImpl<$Res, IncomeModel>;
  @useResult
  $Res call({int income, String currentMonth});
}

/// @nodoc
class _$IncomeModelCopyWithImpl<$Res, $Val extends IncomeModel>
    implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? currentMonth = null,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncomeModelCopyWith<$Res>
    implements $IncomeModelCopyWith<$Res> {
  factory _$$_IncomeModelCopyWith(
          _$_IncomeModel value, $Res Function(_$_IncomeModel) then) =
      __$$_IncomeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int income, String currentMonth});
}

/// @nodoc
class __$$_IncomeModelCopyWithImpl<$Res>
    extends _$IncomeModelCopyWithImpl<$Res, _$_IncomeModel>
    implements _$$_IncomeModelCopyWith<$Res> {
  __$$_IncomeModelCopyWithImpl(
      _$_IncomeModel _value, $Res Function(_$_IncomeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? currentMonth = null,
  }) {
    return _then(_$_IncomeModel(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as int,
      currentMonth: null == currentMonth
          ? _value.currentMonth
          : currentMonth // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncomeModel implements _IncomeModel {
  const _$_IncomeModel({required this.income, required this.currentMonth});

  factory _$_IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeModelFromJson(json);

  @override
  final int income;
  @override
  final String currentMonth;

  @override
  String toString() {
    return 'IncomeModel(income: $income, currentMonth: $currentMonth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeModel &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.currentMonth, currentMonth) ||
                other.currentMonth == currentMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, income, currentMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeModelCopyWith<_$_IncomeModel> get copyWith =>
      __$$_IncomeModelCopyWithImpl<_$_IncomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeModelToJson(
      this,
    );
  }
}

abstract class _IncomeModel implements IncomeModel {
  const factory _IncomeModel(
      {required final int income,
      required final String currentMonth}) = _$_IncomeModel;

  factory _IncomeModel.fromJson(Map<String, dynamic> json) =
      _$_IncomeModel.fromJson;

  @override
  int get income;
  @override
  String get currentMonth;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeModelCopyWith<_$_IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
