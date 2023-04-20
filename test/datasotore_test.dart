import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'mock/mock.mocks.dart';

void main() {
  group('WeatherDatastore', () {
    final mockYumemiWeather = MockYumemiWeather();
    final weatherDatastore = WeatherDatastore(mockYumemiWeather);
    final target = WeatherForecastTarget(
      area: 'Tokyo',
      date: DateTime(2023, 4, 19),
    );

    test('getWeather returns valid weather data successfully', () {
      const weatherJson = '''
        {
          "weather_condition": "cloudy",
          "max_temperature": 25, 
          "min_temperature": 7,
          "date": "2023-04-19T00:00:00.000"
        }
        ''';

      when(mockYumemiWeather.fetchWeather(any)).thenReturn(weatherJson);

      final weatherData = weatherDatastore.getWeather(target);

      expect(weatherData['weather_condition'], 'cloudy');
      expect(weatherData['max_temperature'], 25);
      expect(weatherData['min_temperature'], 7);
      expect(weatherData['date'], '2023-04-19T00:00:00.000');
    });

    test('''
          getWeather throws YumemiWeatherError.invalidParameter 
          when fetchWeather throws invalidParameter error
        ''', () {
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.invalidParameter);

      expect(
        () => weatherDatastore.getWeather(target),
        throwsA(isA<YumemiWeatherError>()),
      );
    });

    test('''
          getWeather throws YumemiWeatherError.unknown 
          when fetchWeather throws unknown error
        ''', () {
      when(mockYumemiWeather.fetchWeather(any))
          .thenThrow(YumemiWeatherError.unknown);

      expect(
        () => weatherDatastore.getWeather(target),
        throwsA(isA<YumemiWeatherError>()),
      );
    });

    test('encode WeatherForecastTarget successfully', () {
      final weatherJson = weatherDatastore.toJson(target);

      expect(
        weatherJson,
        '{"area":"Tokyo","date":"2023-04-19T00:00:00.000"}',
      );
    });

    test('decode WeatherJson to Map', () {
      const weatherJson = '''
      {
        "weather_condition": "cloudy", 
        "max_temperature": 25, 
        "min_temperature": 7, 
        "date": "2023-04-19T00:00:00.000"
      }
      ''';

      final weatherData = weatherDatastore.toMap(weatherJson);

      expect(weatherData['weather_condition'], 'cloudy');
      expect(weatherData['max_temperature'], 25);
      expect(weatherData['min_temperature'], 7);
      expect(weatherData['date'], '2023-04-19T00:00:00.000');
    });

    test('decode invalid json to Map throws an exception', () {
      // 無効なjson文字列
      const invalidJson = '{"invalid_json":}';

      // toMapメソッドが例外を投げることを確認
      expect(
        () => weatherDatastore.toMap(invalidJson),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
