import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherDatastore>()])
void main() {
  group('WeatherRepository', () {
    // Arrange
    final weatherDatasotre = MockWeatherDatastore();
    final weatherRepository = WeatherRepository(weatherDatasotre);
    final target = WeatherForecastTarget(
      area: 'Tokyo',
      date: DateTime(2023, 4, 19),
    );

    // 成功ケース
    // datastoreが正しいMapを返すとき、Result<WeatherInfo>を返す
    test('''
        When WeatherDatastore returns Map,
        returns Result<WeatherInfo, String>.success 
      ''', () {
      // Arrange
      when(weatherDatasotre.getWeather(any)).thenReturn({
        'weather_condition': 'cloudy',
        'max_temperature': 25,
        'min_temperature': 7,
        'date': '2023-04-19T00:00:00.000',
      });

      // Act
      final result = weatherRepository.getWeather(target);

      // Assert
      expect(
        result,
        const Result<WeatherInfo, String>.success(
          WeatherInfo(
            weatherCondition: WeatherCondition.cloudy,
            maxTemperature: 25,
            minTemperature: 7,
          ),
        ),
      );
    });

    // 失敗ケース1
    // datastoreがYumemiWeatherError.invalidParameterを投げるとき
    // Result<String>('パラメータが間違っています。')を返す
    test('''
      When WeatherDatastore throws YumemiWeatherError.invalidParameter,
      returns Result<WeatherInfo, String>.failure
    ''', () {
      // Arrange
      when(weatherDatasotre.getWeather(any))
          .thenThrow(YumemiWeatherError.invalidParameter);

      // Act
      final result = weatherRepository.getWeather(target);

      // Assert
      expect(
        result,
        const Result<WeatherInfo, String>.failure(
          'パラメータが間違っています。',
        ),
      );
    });

    // 失敗ケース2
    // datasotreがYumemiWeatherError.unknownを投げる時
    // Result<String>('予期せぬ不具合が発生しました。')を返す
    test('''
      When WeatherDatastore throws YumemiWeatherError.unknown,
      returns Result<WeatherInfo, String>.failure
    ''', () {
      // Arrange
      when(weatherDatasotre.getWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      // Act
      final result = weatherRepository.getWeather(target);

      // Assert
      expect(
        result,
        const Result<WeatherInfo, String>.failure(
          '予期せぬ不具合が発生しました。',
        ),
      );
    });

    // 失敗ケース3
    // datastoreがExceptionを投げる時、
    // Result<String>('例外が発生しました。')を返す
    test('''
      When WeatherDatastore throws Exception,
      returns Result<WeatherInfo, String>.failure
    ''', () {
      // Arrange
      when(weatherDatasotre.getWeather(any)).thenThrow(Exception());

      // Act
      final result = weatherRepository.getWeather(target);

      // Assert
      expect(
        result,
        const Result<WeatherInfo, String>.failure(
          '例外が発生しました。',
        ),
      );
    });
  });
}
