enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}

extension WeatherConditionExt on Iterable<WeatherCondition> {
  WeatherCondition? byNameOrNull(String name) {
    for (final element in this) {
      if (element.name == name) {
        return element;
      }
    }
    return null;
  }
}
