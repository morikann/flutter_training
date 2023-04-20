// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint

part of 'weather_forecast_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherForecastTarget _$$_WeatherForecastTargetFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_WeatherForecastTarget',
      json,
      ($checkedConvert) {
        final val = _$_WeatherForecastTarget(
          area: $checkedConvert('area', (v) => v as String),
          date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_WeatherForecastTargetToJson(
        _$_WeatherForecastTarget instance) =>
    <String, dynamic>{
      'area': instance.area,
      'date': instance.date.toIso8601String(),
    };
