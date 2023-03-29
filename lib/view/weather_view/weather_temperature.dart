import 'package:flutter/material.dart';

class WeatherTemperature extends StatelessWidget {
  const WeatherTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final largeLabel = textTheme.labelLarge;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '** ℃',
              textAlign: TextAlign.center,
              style: largeLabel?.copyWith(
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '** ℃',
              textAlign: TextAlign.center,
              style: largeLabel?.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
