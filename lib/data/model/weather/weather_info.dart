import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';
part 'weather_info.g.dart';

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required WeatherCondition weatherCondition,
    required int maxTemperature,
    required int minTemperature,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, Object?> json) =>
      _$WeatherInfoFromJson(json);
}
