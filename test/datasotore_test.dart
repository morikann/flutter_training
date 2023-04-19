import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/datastore/weather_datastore.dart';

import 'mock/mock.mocks.dart';

void main() {
  group('WeatherDatastore', () {
    test('decode WeatherJson to Map', () {
      final mockYumemiWeather = MockYumemiWeather();
      final weatherDatastore = WeatherDatastore(mockYumemiWeather);
      const weatherJson =
          '{"weather_condition": "cloudy", "max_temperature": 25, "min_temperature": 7, "date": "2023-04-19T00:00:00.000"}';

      final weatherData = weatherDatastore.toMap(weatherJson);

      expect(weatherData['weather_condition'], 'cloudy');
      expect(weatherData['max_temperature'], 25);
      expect(weatherData['min_temperature'], 7);
      expect(weatherData['date'], '2023-04-19T00:00:00.000');
    });

    test('decode invalid json to Map throws an exception', () {
      final mockYumemiWeather = MockYumemiWeather();
      final weatherDatastore = WeatherDatastore(mockYumemiWeather);

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
