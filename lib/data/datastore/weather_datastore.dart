import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
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

  Future<Map<String, dynamic>> getWeather(WeatherForecastTarget target) async {
    final json = toJson(target);
    final weatherJsonData = await compute(weatherClient.syncFetchWeather, json);
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
