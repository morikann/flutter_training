import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/weather/weather_forecast_target.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

final weatherDatastoreProvider = Provider((ref) {
  final weatherClient = YumemiWeather();
  return WeatherDatastore(weatherClient);
});

class WeatherDatastore {
  const WeatherDatastore(this.weatherClient);

  final YumemiWeather weatherClient;

  Map<String, dynamic> fetchWeather(WeatherForecastTarget target) {
    final json = jsonEncode(target);
    final weatherJsonData = weatherClient.fetchWeather(json);
    final weatherData = jsonDecode(weatherJsonData) as Map<String, dynamic>;
    return weatherData;
  }
}
