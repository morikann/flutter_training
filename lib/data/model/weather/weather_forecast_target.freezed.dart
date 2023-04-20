// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_target.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherForecastTarget _$WeatherForecastTargetFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastTarget.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastTarget {
  String get area => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherForecastTargetCopyWith<WeatherForecastTarget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastTargetCopyWith<$Res> {
  factory $WeatherForecastTargetCopyWith(WeatherForecastTarget value,
          $Res Function(WeatherForecastTarget) then) =
      _$WeatherForecastTargetCopyWithImpl<$Res, WeatherForecastTarget>;
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class _$WeatherForecastTargetCopyWithImpl<$Res,
        $Val extends WeatherForecastTarget>
    implements $WeatherForecastTargetCopyWith<$Res> {
  _$WeatherForecastTargetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherForecastTargetCopyWith<$Res>
    implements $WeatherForecastTargetCopyWith<$Res> {
  factory _$$_WeatherForecastTargetCopyWith(_$_WeatherForecastTarget value,
          $Res Function(_$_WeatherForecastTarget) then) =
      __$$_WeatherForecastTargetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String area, DateTime date});
}

/// @nodoc
class __$$_WeatherForecastTargetCopyWithImpl<$Res>
    extends _$WeatherForecastTargetCopyWithImpl<$Res, _$_WeatherForecastTarget>
    implements _$$_WeatherForecastTargetCopyWith<$Res> {
  __$$_WeatherForecastTargetCopyWithImpl(_$_WeatherForecastTarget _value,
      $Res Function(_$_WeatherForecastTarget) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? date = null,
  }) {
    return _then(_$_WeatherForecastTarget(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherForecastTarget implements _WeatherForecastTarget {
  const _$_WeatherForecastTarget({required this.area, required this.date});

  factory _$_WeatherForecastTarget.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherForecastTargetFromJson(json);

  @override
  final String area;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'WeatherForecastTarget(area: $area, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherForecastTarget &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, area, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherForecastTargetCopyWith<_$_WeatherForecastTarget> get copyWith =>
      __$$_WeatherForecastTargetCopyWithImpl<_$_WeatherForecastTarget>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherForecastTargetToJson(
      this,
    );
  }
}

abstract class _WeatherForecastTarget implements WeatherForecastTarget {
  const factory _WeatherForecastTarget(
      {required final String area,
      required final DateTime date}) = _$_WeatherForecastTarget;

  factory _WeatherForecastTarget.fromJson(Map<String, dynamic> json) =
      _$_WeatherForecastTarget.fromJson;

  @override
  String get area;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherForecastTargetCopyWith<_$_WeatherForecastTarget> get copyWith =>
      throw _privateConstructorUsedError;
}
