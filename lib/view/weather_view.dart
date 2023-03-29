import 'package:flutter/material.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final largeLabel = textTheme.labelLarge;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            FractionallySizedBox(
              widthFactor: 0.5,
              child: Column(
                children: [
                  const AspectRatio(
                    aspectRatio: 1,
                    child: Placeholder(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
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
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Close'),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Reload'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
