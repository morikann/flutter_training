import 'package:yumemi_weather/yumemi_weather.dart';

class Weather {
  const Weather(this._weatherClient);

  final YumemiWeather _weatherClient;

  String? fetchWeather() {
    return _weatherClient.fetchSimpleWeather();
  }
}
