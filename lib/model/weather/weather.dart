import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/model/weather/weather_info.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class Weather {
  const Weather(this._weatherClient);

  final YumemiWeather _weatherClient;

  Result<WeatherInfo, String> fetchWeather(WeatherForecastTarget target) {
    try {
      final json = jsonEncode(target);
      final weatherJsonData = _weatherClient.fetchWeather(json);
      final weatherData = jsonDecode(weatherJsonData) as Map<String, dynamic>;
      final weatherInfo = WeatherInfo.fromJson(weatherData);
      return Result.success(weatherInfo);
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
