import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/model/weather/weather_info.dart';
import 'package:flutter_training/provider/weather_client_provider.dart';
import 'package:flutter_training/view/weather_view/weather_page_ui_state.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

// WeatherPageの状態を返すプロバイダ
final weatherPageUiStateProvider =
    StateNotifierProvider<WeatherPageUiStateNotifier, WeatherPageUiState>(
        (ref) {
  final weatherClient = ref.watch(weatherClientProvider);
  return WeatherPageUiStateNotifier(weatherClient: weatherClient);
});

class WeatherPageUiStateNotifier extends StateNotifier<WeatherPageUiState> {
  WeatherPageUiStateNotifier({required this.weatherClient})
      : super(const WeatherPageUiState.init());

  final YumemiWeather weatherClient;

  void fetchWeather(WeatherForecastTarget target) {
    try {
      final json = jsonEncode(target);
      final weatherJsonData = weatherClient.fetchWeather(json);
      final weatherData = jsonDecode(weatherJsonData) as Map<String, dynamic>;
      final weatherInfo = WeatherInfo.fromJson(weatherData);
      state = WeatherPageUiState.success(weatherInfo);
    } on Exception catch (e) {
      debugPrint('$e');
      state = const WeatherPageUiState.failure('例外が発生しました。');
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          state = const WeatherPageUiState.failure('パラメータが間違っています。');
          break;
        case YumemiWeatherError.unknown:
          state = const WeatherPageUiState.failure('予期せぬ不具合が発生しました。');
      }
    }
  }
}
