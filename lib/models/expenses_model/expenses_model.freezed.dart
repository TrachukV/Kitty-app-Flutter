// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpensesModel _$ExpensesModelFromJson(Map<String, dynamic> json) {
  return _ExpensesModel.fromJson(json);
}

/// @nodoc
mixin _$ExpensesModel {
  int get totalExpenses => throw _privateConstructorUsedError;
  String get currentMonth => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpensesModelCopyWith<ExpensesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesModelCopyWith<$Res> {
  factory $ExpensesModelCopyWith(
          ExpensesModel value, $Res Function(ExpensesModel) then) =
      _$ExpensesModelCopyWithImpl<$Res, ExpensesModel>;
  @useResult
  $Res call({int totalExpenses, String currentMonth, int id});
}

/// @nodoc
class _$ExpensesModelCopyWithImpl<$Res, $Val extends ExpensesModel>
    implements $ExpensesModelCopyWith<$Res> {
  _$ExpensesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpenses = null,
    Object? currentMonth = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ExpensesModelCopyWith<$Res>
    implements $ExpensesModelCopyWith<$Res> {
  factory _$$_ExpensesModelCopyWith(
          _$_ExpensesModel value, $Res Function(_$_ExpensesModel) then) =
      __$$_ExpensesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalExpenses, String currentMonth, int id});
}

/// @nodoc
class __$$_ExpensesModelCopyWithImpl<$Res>
    extends _$ExpensesModelCopyWithImpl<$Res, _$_ExpensesModel>
    implements _$$_ExpensesModelCopyWith<$Res> {
  __$$_ExpensesModelCopyWithImpl(
      _$_ExpensesModel _value, $Res Function(_$_ExpensesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalExpenses = null,
    Object? currentMonth = null,
    Object? id = null,
  }) {
    return _then(_$_ExpensesModel(
      totalExpenses: null == totalExpenses
          ? _value.totalExpenses
          : totalExpenses // ignore: cast_nullable_to_non_nullable
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
class _$_ExpensesModel implements _ExpensesModel {
  const _$_ExpensesModel(
      {required this.totalExpenses,
      required this.currentMonth,
      required this.id});

  factory _$_ExpensesModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExpensesModelFromJson(json);

  @override
  final int totalExpenses;
  @override
  final String currentMonth;
  @override
  final int id;

  @override
  String toString() {
    return 'ExpensesModel(totalExpenses: $totalExpenses, currentMonth: $currentMonth, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpensesModel &&
            (identical(other.totalExpenses, totalExpenses) ||
                other.totalExpenses == totalExpenses) &&
            (identical(other.currentMonth, currentMonth) ||
                other.currentMonth == currentMonth) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalExpenses, currentMonth, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpensesModelCopyWith<_$_ExpensesModel> get copyWith =>
      __$$_ExpensesModelCopyWithImpl<_$_ExpensesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpensesModelToJson(
      this,
    );
  }
}

abstract class _ExpensesModel implements ExpensesModel {
  const factory _ExpensesModel(
      {required final int totalExpenses,
      required final String currentMonth,
      required final int id}) = _$_ExpensesModel;

  factory _ExpensesModel.fromJson(Map<String, dynamic> json) =
      _$_ExpensesModel.fromJson;

  @override
  int get totalExpenses;
  @override
  String get currentMonth;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_ExpensesModelCopyWith<_$_ExpensesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
