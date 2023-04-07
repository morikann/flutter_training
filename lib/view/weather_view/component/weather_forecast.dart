import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_training/model/weather/weather_info.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key, this.weatherInfo});

  final WeatherInfo? weatherInfo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherInfo == null
              ? const Placeholder()
              : SvgPicture.asset(
                  'images/${weatherInfo?.weatherCondition.name}.svg',
                  semanticsLabel: '${weatherInfo?.weatherCondition.name} image',
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
                      : '${weatherInfo?.minTemperature} ℃',
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
                      : '${weatherInfo?.maxTemperature} ℃',
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
