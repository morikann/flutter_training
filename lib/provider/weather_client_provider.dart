import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

final weatherClientProvider = Provider<YumemiWeather>((ref) => YumemiWeather());
