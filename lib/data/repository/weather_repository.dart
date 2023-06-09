import 'package:flutter_training/common/constants/error_message.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
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

  Future<Result<WeatherInfo, String>> getWeather(
    WeatherForecastTarget target,
  ) async {
    try {
      final weatherData = await datastore.getWeather(target);
      final weatherInfo = WeatherInfo.fromJson(weatherData);
      return Result.success(weatherInfo);
    } on YumemiWeatherError catch (e) {
      switch (e) {
        case YumemiWeatherError.invalidParameter:
          return const Result.failure(ErrorMessage.invalidParameter);
        case YumemiWeatherError.unknown:
          return const Result.failure(ErrorMessage.unknown);
      }
    } on Exception catch (_) {
      return const Result.failure(ErrorMessage.other);
    }
  }
}
