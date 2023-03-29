import 'package:flutter/material.dart';
import 'package:flutter_training/view/component/app_button.dart';
import 'package:flutter_training/view/weather_view/weather_panel.dart';
import 'package:flutter_training/view/weather_view/weather_temperature.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              Column(
                children: const [
                  WeatherPanel(),
                  WeatherTemperature(),
                ],
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            title: 'Close',
                            onPressed: () {},
                          ),
                        ),
                        Expanded(
                          child: AppButton(
                            title: 'Reload',
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
