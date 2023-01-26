// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsModel {
  String get title => throw _privateConstructorUsedError;
  int get counterTransactions => throw _privateConstructorUsedError;
  int get totalAmount => throw _privateConstructorUsedError;
  double get percentage => throw _privateConstructorUsedError;
  IconModel get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res, StatisticsModel>;
  @useResult
  $Res call(
      {String title,
      int counterTransactions,
      int totalAmount,
      double percentage,
      IconModel icon});

  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res, $Val extends StatisticsModel>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? counterTransactions = null,
    Object? totalAmount = null,
    Object? percentage = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      counterTransactions: null == counterTransactions
          ? _value.counterTransactions
          : counterTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_StatisticsModelCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$_StatisticsModelCopyWith(
          _$_StatisticsModel value, $Res Function(_$_StatisticsModel) then) =
      __$$_StatisticsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      int counterTransactions,
      int totalAmount,
      double percentage,
      IconModel icon});

  @override
  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class __$$_StatisticsModelCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res, _$_StatisticsModel>
    implements _$$_StatisticsModelCopyWith<$Res> {
  __$$_StatisticsModelCopyWithImpl(
      _$_StatisticsModel _value, $Res Function(_$_StatisticsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? counterTransactions = null,
    Object? totalAmount = null,
    Object? percentage = null,
    Object? icon = null,
  }) {
    return _then(_$_StatisticsModel(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      counterTransactions: null == counterTransactions
          ? _value.counterTransactions
          : counterTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StatisticsModel implements _StatisticsModel {
  const _$_StatisticsModel(
      {required this.title,
      required this.counterTransactions,
      required this.totalAmount,
      required this.percentage,
      required this.icon});

  factory _$_StatisticsModel.fromJson(Map<String, dynamic> json) =>
      _$$_StatisticsModelFromJson(json);

  @override
  final String title;
  @override
  final int counterTransactions;
  @override
  final int totalAmount;
  @override
  final double percentage;
  @override
  final IconModel icon;

  @override
  String toString() {
    return 'StatisticsModel(title: $title, counterTransactions: $counterTransactions, totalAmount: $totalAmount, percentage: $percentage, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatisticsModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.counterTransactions, counterTransactions) ||
                other.counterTransactions == counterTransactions) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, counterTransactions, totalAmount, percentage, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatisticsModelCopyWith<_$_StatisticsModel> get copyWith =>
      __$$_StatisticsModelCopyWithImpl<_$_StatisticsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatisticsModelToJson(
      this,
    );
  }
}

abstract class _StatisticsModel implements StatisticsModel {
  const factory _StatisticsModel(
      {required final String title,
      required final int counterTransactions,
      required final int totalAmount,
      required final double percentage,
      required final IconModel icon}) = _$_StatisticsModel;

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$_StatisticsModel.fromJson;

  @override
  String get title;
  @override
  int get counterTransactions;
  @override
  int get totalAmount;
  @override
  double get percentage;
  @override
  IconModel get icon;
  @override
  @JsonKey(ignore: true)
  _$$_StatisticsModelCopyWith<_$_StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
