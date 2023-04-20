import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WeatherDatastore>()])
void main() {
  group('WeatherRepository', () {
    // 成功
    // datastoreが正しいMapを返すとき、Result<WeatherInfo>を返す
    test('Returns Result<WeatherInfo> when datastore returns Map', () {
      // Arrange
      final weatherDatasotre = MockWeatherDatastore();
      final weatherRepository = WeatherRepository(weatherDatasotre);
      final target = WeatherForecastTarget(
        area: 'Tokyo',
        date: DateTime(2023, 4, 19),
      );
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
  });
}
