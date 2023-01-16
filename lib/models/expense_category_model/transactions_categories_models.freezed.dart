// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_categories_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionsCategoriesModel _$TransactionsCategoriesModelFromJson(
    Map<String, dynamic> json) {
  return _TransactionsCategoriesModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionsCategoriesModel {
  int get categoryId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  IconModel get icon => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsCategoriesModelCopyWith<TransactionsCategoriesModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsCategoriesModelCopyWith<$Res> {
  factory $TransactionsCategoriesModelCopyWith(
          TransactionsCategoriesModel value,
          $Res Function(TransactionsCategoriesModel) then) =
      _$TransactionsCategoriesModelCopyWithImpl<$Res,
          TransactionsCategoriesModel>;
  @useResult
  $Res call(
      {int categoryId,
      String title,
      double totalAmount,
      int amount,
      IconModel icon,
      String type});

  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class _$TransactionsCategoriesModelCopyWithImpl<$Res,
        $Val extends TransactionsCategoriesModel>
    implements $TransactionsCategoriesModelCopyWith<$Res> {
  _$TransactionsCategoriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? title = null,
    Object? totalAmount = null,
    Object? amount = null,
    Object? icon = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_TransactionsCategoriesModelCopyWith<$Res>
    implements $TransactionsCategoriesModelCopyWith<$Res> {
  factory _$$_TransactionsCategoriesModelCopyWith(
          _$_TransactionsCategoriesModel value,
          $Res Function(_$_TransactionsCategoriesModel) then) =
      __$$_TransactionsCategoriesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String title,
      double totalAmount,
      int amount,
      IconModel icon,
      String type});

  @override
  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class __$$_TransactionsCategoriesModelCopyWithImpl<$Res>
    extends _$TransactionsCategoriesModelCopyWithImpl<$Res,
        _$_TransactionsCategoriesModel>
    implements _$$_TransactionsCategoriesModelCopyWith<$Res> {
  __$$_TransactionsCategoriesModelCopyWithImpl(
      _$_TransactionsCategoriesModel _value,
      $Res Function(_$_TransactionsCategoriesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? title = null,
    Object? totalAmount = null,
    Object? amount = null,
    Object? icon = null,
    Object? type = null,
  }) {
    return _then(_$_TransactionsCategoriesModel(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_TransactionsCategoriesModel implements _TransactionsCategoriesModel {
  const _$_TransactionsCategoriesModel(
      {required this.categoryId,
      required this.title,
      this.totalAmount = 0.0,
      this.amount = 0,
      required this.icon,
      required this.type});

  factory _$_TransactionsCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionsCategoriesModelFromJson(json);

  @override
  final int categoryId;
  @override
  final String title;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  @JsonKey()
  final int amount;
  @override
  final IconModel icon;
  @override
  final String type;

  @override
  String toString() {
    return 'TransactionsCategoriesModel(categoryId: $categoryId, title: $title, totalAmount: $totalAmount, amount: $amount, icon: $icon, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsCategoriesModel &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, title, totalAmount, amount, icon, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionsCategoriesModelCopyWith<_$_TransactionsCategoriesModel>
      get copyWith => __$$_TransactionsCategoriesModelCopyWithImpl<
          _$_TransactionsCategoriesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionsCategoriesModelToJson(
      this,
    );
  }
}

abstract class _TransactionsCategoriesModel
    implements TransactionsCategoriesModel {
  const factory _TransactionsCategoriesModel(
      {required final int categoryId,
      required final String title,
      final double totalAmount,
      final int amount,
      required final IconModel icon,
      required final String type}) = _$_TransactionsCategoriesModel;

  factory _TransactionsCategoriesModel.fromJson(Map<String, dynamic> json) =
      _$_TransactionsCategoriesModel.fromJson;

  @override
  int get categoryId;
  @override
  String get title;
  @override
  double get totalAmount;
  @override
  int get amount;
  @override
  IconModel get icon;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsCategoriesModelCopyWith<_$_TransactionsCategoriesModel>
      get copyWith => throw _privateConstructorUsedError;
}
