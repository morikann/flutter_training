import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_forecast_target.freezed.dart';
part 'weather_forecast_target.g.dart';

@freezed
class WeatherForecastTarget with _$WeatherForecastTarget {
  const factory WeatherForecastTarget({
    required String area,
    required DateTime date,
  }) = _WeatherForecastTarget;

  factory WeatherForecastTarget.fromJson(Map<String, Object?> json) =>
      _$WeatherForecastTargetFromJson(json);
}
