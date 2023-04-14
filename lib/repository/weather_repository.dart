import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/datastore/weather_datastore.dart';
import 'package:flutter_training/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/model/weather/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(WeatherRepositoryRef ref) {
  final weatherData = ref.watch(weatherDatastoreProvider);
  return WeatherRepository(weatherData);
}

class WeatherRepository {
  const WeatherRepository(this.datastore);
  final WeatherDatastore datastore;

  Result<WeatherInfo, String> getWeather(WeatherForecastTarget target) {
    try {
      final weatherData = datastore.fetchWeather(target);
      final weatherInfo = WeatherInfo.fromJson(weatherData);
      return Result.success(weatherInfo);
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          return const Result.failure('パラメータが間違っています。');
        case YumemiWeatherError.unknown:
          return const Result.failure('予期せぬ不具合が発生しました。');
      }
    } on Exception catch (_) {
      return const Result.failure('例外が発生しました。');
    }
  }
}
