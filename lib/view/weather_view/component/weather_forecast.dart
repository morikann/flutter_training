import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key, this.weatherCondition});

  final String? weatherCondition;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: weatherCondition == null
              ? const Placeholder()
              : SvgPicture.asset(
                  'images/$weatherCondition.svg',
                  semanticsLabel: '$weatherCondition image',
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '** ℃',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge?.copyWith(
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '** ℃',
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
