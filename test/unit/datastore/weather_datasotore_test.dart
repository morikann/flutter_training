import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_datasotore_test.mocks.dart';

@GenerateNiceMocks([MockSpec<YumemiWeather>()])
void main() {
  // Arrange
  final mockYumemiWeather = MockYumemiWeather();
  final weatherDatastore = WeatherDatastore(mockYumemiWeather);
  final target = WeatherForecastTarget(
    area: 'Tokyo',
    date: DateTime(2023, 4, 19),
  );

  test('getWeather returns valid weather data successfully', () {
    // Arrange
    const weatherJson = '''
        {
          "weather_condition": "cloudy",
          "max_temperature": 25, 
          "min_temperature": 7,
          "date": "2023-04-19T00:00:00.000"
        }
        ''';

    when(mockYumemiWeather.fetchWeather(any)).thenReturn(weatherJson);

    // Act
    final weatherData = weatherDatastore.getWeather(target);

    // Assert
    expect(weatherData['weather_condition'], 'cloudy');
    expect(weatherData['max_temperature'], 25);
    expect(weatherData['min_temperature'], 7);
    expect(weatherData['date'], '2023-04-19T00:00:00.000');
  });

  test('''
          getWeather throws YumemiWeatherError.invalidParameter 
          when fetchWeather throws invalidParameter error
        ''', () {
    // Arrange
    when(mockYumemiWeather.fetchWeather(any))
        .thenThrow(YumemiWeatherError.invalidParameter);

    // Act, Assert
    expect(
      () => weatherDatastore.getWeather(target),
      throwsA(isA<YumemiWeatherError>()),
    );
  });

  test('''
          getWeather throws YumemiWeatherError.unknown 
          when fetchWeather throws unknown error
        ''', () {
    // Arrange
    when(mockYumemiWeather.fetchWeather(any))
        .thenThrow(YumemiWeatherError.unknown);

    // Act, Assert
    expect(
      () => weatherDatastore.getWeather(target),
      throwsA(isA<YumemiWeatherError>()),
    );
  });

  test('encode WeatherForecastTarget successfully', () {
    // Act
    final weatherJson = weatherDatastore.toJson(target);

    // Assert
    expect(
      weatherJson,
      '{"area":"Tokyo","date":"2023-04-19T00:00:00.000"}',
    );
  });

  test('decode WeatherJson to Map', () {
    // Arrange
    const weatherJson = '''
      {
        "weather_condition": "cloudy", 
        "max_temperature": 25, 
        "min_temperature": 7, 
        "date": "2023-04-19T00:00:00.000"
      }
      ''';

    // Act
    final weatherData = weatherDatastore.toMap(weatherJson);

    // Assert
    expect(weatherData['weather_condition'], 'cloudy');
    expect(weatherData['max_temperature'], 25);
    expect(weatherData['min_temperature'], 7);
    expect(weatherData['date'], '2023-04-19T00:00:00.000');
  });

  test('decode invalid json to Map throws an exception', () {
    // Arrange
    // 無効なjson文字列
    const invalidJson = '{"invalid_json":}';

    // Act, Assert
    // toMapメソッドが例外を投げることを確認
    expect(
      () => weatherDatastore.toMap(invalidJson),
      throwsA(isA<FormatException>()),
    );
  });
}
