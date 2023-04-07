class WeatherQuery {
  WeatherQuery({
    required this.area,
    required this.date,
  });

  final String area;
  final DateTime date;

  Map<String, dynamic> toJson() {
    return {
      'area': area,
      'date': date.toString(),
    };
  }
}
