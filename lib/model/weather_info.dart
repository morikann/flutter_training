class WeatherInfo {
  const WeatherInfo({
    required this.weatherCondition,
    required this.maxTemperature,
    required this.minTemperature,
    required this.date,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    Never throwFormatException(String message) =>
        throw FormatException(message);

    final weatherCondition = WeatherCondition.values
        .byNameOrNull(json['weather_condition'].toString());
    if (weatherCondition == null) {
      throw const FormatException('weather_condition の値が適切ではありません。');
    }

    final maxTemperature = int.tryParse(json['max_temperature'].toString());
    if (maxTemperature == null) {
      throwFormatException('max_temperature の値が適切ではありません。');
    }

    final minTemperature = int.tryParse(json['min_temperature'].toString());
    if (minTemperature == null) {
      throwFormatException('min_temperature の値が適切ではありません。');
    }

    final date = json['date']?.toString();
    if (date == null) {
      throwFormatException('date の値が適切ではありません。');
    }

    return WeatherInfo(
      weatherCondition: weatherCondition,
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
      date: DateTime.parse(date),
    );
  }

  final WeatherCondition weatherCondition;
  final int maxTemperature;
  final int minTemperature;
  final DateTime date;
}

enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
}

extension _WeatherConditionExt on Iterable<WeatherCondition> {
  WeatherCondition? byNameOrNull(String name) {
    for (final element in this) {
      if (element.name == name) {
        return element;
      }
    }
    return null;
  }
}
