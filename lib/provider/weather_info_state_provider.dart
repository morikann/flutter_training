import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/weather/weather_info.dart';

// 天気予報の状態を返すプロバイダ
final weatherInfoStateProvider =
    StateProvider.autoDispose<WeatherInfo?>((ref) => null);
