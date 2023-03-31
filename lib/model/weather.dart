import 'package:yumemi_weather/yumemi_weather.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}
class Weather {
  const Weather(this._weatherClient);

  final YumemiWeather _weatherClient;

  WeatherCondition? fetchWeather() {
    final condition = _weatherClient.fetchSimpleWeather();
    return WeatherCondition.values.byName(condition);
  }
}
