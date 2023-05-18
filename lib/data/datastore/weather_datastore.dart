import 'dart:convert';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_datastore.g.dart';

@riverpod
WeatherDatastore weatherDatastore(WeatherDatastoreRef ref) {
  final weatherClient = YumemiWeather();
  return WeatherDatastore(weatherClient);
}

class WeatherDatastore {
  const WeatherDatastore(this.weatherClient);

  final YumemiWeather weatherClient;

  Map<String, dynamic> getWeather(WeatherForecastTarget target) {
    final json = toJson(target);
    final weatherJsonData = weatherClient.fetchWeather(json);
    final weatherData = toMap(weatherJsonData);
    return weatherData;
  }

  @visibleForTesting
  String toJson(WeatherForecastTarget target) {
    return jsonEncode(target);
  }

  @visibleForTesting
  Map<String, dynamic> toMap(String json) {
    return jsonDecode(json) as Map<String, dynamic>;
  }
}
