import 'package:yumemi_weather/yumemi_weather.dart';

class Weather {
  String fetchWeather() {
    return YumemiWeather().fetchSimpleWeather();
  }
}
