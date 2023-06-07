import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';

/// 天気予報の状態を返すプロバイダ
final weatherInfoStateProvider =
    StateProvider.autoDispose<WeatherInfo?>((ref) => null);

class WeatherForecast extends ConsumerWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final weatherInfo = ref.watch(weatherInfoStateProvider);

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherInfo == null
              ? const Placeholder()
              : SvgPicture.asset(
                  weatherInfo.weatherCondition.svgImagePath,
                  semanticsLabel: '${weatherInfo.weatherCondition.name} image',
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  weatherInfo == null
                      ? '** ℃'
                      : '${weatherInfo.minTemperature} ℃',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge?.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  weatherInfo == null
                      ? '** ℃'
                      : '${weatherInfo.maxTemperature} ℃',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge?.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

extension WeatherConditionExtension on WeatherCondition {
  String get svgImagePath => 'images/$name.svg';
}
