import 'package:flutter/material.dart';
import 'package:flutter_training/common/result.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}

class Weather {
  const Weather(this._weatherClient);

  final YumemiWeather _weatherClient;

  Result<WeatherCondition, String> fetchWeather() {
    try {
      final condition = _weatherClient.fetchThrowsWeather('Tokyo');
      final weatherCondition = WeatherCondition.values.byName(condition);
      return Result.success(weatherCondition);
    } on Exception catch (e) {
      debugPrint('$e');
      return const Result.failure('例外が発生しました。');
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          return const Result.failure('パラメータが間違っています。');
        case YumemiWeatherError.unknown:
          return const Result.failure('予期せぬ不具合が発生しました。');
      }
    }
  }
}
