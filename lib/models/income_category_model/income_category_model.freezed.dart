// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncomeCategoryModel _$IncomeCategoryModelFromJson(Map<String, dynamic> json) {
  return _IncomeCategory.fromJson(json);
}

/// @nodoc
mixin _$IncomeCategoryModel {
  String get title => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get entries => throw _privateConstructorUsedError;
  IconModel get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeCategoryModelCopyWith<IncomeCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeCategoryModelCopyWith<$Res> {
  factory $IncomeCategoryModelCopyWith(
          IncomeCategoryModel value, $Res Function(IncomeCategoryModel) then) =
      _$IncomeCategoryModelCopyWithImpl<$Res, IncomeCategoryModel>;
  @useResult
  $Res call({String title, double totalAmount, int entries, IconModel icon});

  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class _$IncomeCategoryModelCopyWithImpl<$Res, $Val extends IncomeCategoryModel>
    implements $IncomeCategoryModelCopyWith<$Res> {
  _$IncomeCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalAmount = null,
    Object? entries = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IconModelCopyWith<$Res> get icon {
    return $IconModelCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_IncomeCategoryCopyWith<$Res>
    implements $IncomeCategoryModelCopyWith<$Res> {
  factory _$$_IncomeCategoryCopyWith(
          _$_IncomeCategory value, $Res Function(_$_IncomeCategory) then) =
      __$$_IncomeCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, double totalAmount, int entries, IconModel icon});

  @override
  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class __$$_IncomeCategoryCopyWithImpl<$Res>
    extends _$IncomeCategoryModelCopyWithImpl<$Res, _$_IncomeCategory>
    implements _$$_IncomeCategoryCopyWith<$Res> {
  __$$_IncomeCategoryCopyWithImpl(
      _$_IncomeCategory _value, $Res Function(_$_IncomeCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? totalAmount = null,
    Object? entries = null,
    Object? icon = null,
  }) {
    return _then(_$_IncomeCategory(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_IncomeCategory implements _IncomeCategory {
  const _$_IncomeCategory(
      {required this.title,
      this.totalAmount = 0.0,
      this.entries = 0,
      required this.icon});

  factory _$_IncomeCategory.fromJson(Map<String, dynamic> json) =>
      _$$_IncomeCategoryFromJson(json);

  @override
  final String title;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final int entries;
  @override
  final IconModel icon;

  @override
  String toString() {
    return 'IncomeCategoryModel(title: $title, totalAmount: $totalAmount, entries: $entries, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncomeCategory &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.entries, entries) || other.entries == entries) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, totalAmount, entries, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncomeCategoryCopyWith<_$_IncomeCategory> get copyWith =>
      __$$_IncomeCategoryCopyWithImpl<_$_IncomeCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncomeCategoryToJson(
      this,
    );
  }
}

abstract class _IncomeCategory implements IncomeCategoryModel {
  const factory _IncomeCategory(
      {required final String title,
      final double totalAmount,
      final int entries,
      required final IconModel icon}) = _$_IncomeCategory;

  factory _IncomeCategory.fromJson(Map<String, dynamic> json) =
      _$_IncomeCategory.fromJson;

  @override
  String get title;
  @override
  double get totalAmount;
  @override
  int get entries;
  @override
  IconModel get icon;
  @override
  @JsonKey(ignore: true)
  _$$_IncomeCategoryCopyWith<_$_IncomeCategory> get copyWith =>
      throw _privateConstructorUsedError;
}