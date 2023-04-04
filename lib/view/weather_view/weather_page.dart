import 'package:flutter/material.dart';
import 'package:flutter_training/model/weather.dart';
import 'package:flutter_training/view/weather_view/component/error_dialog.dart';
import 'package:flutter_training/view/weather_view/component/weather_forecast.dart';
import 'package:go_router/go_router.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

final _weather = Weather(YumemiWeather());

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  static const path = '/weather_page';

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherCondition? _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherForecast(weatherCondition: _weatherCondition),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: context.pop,
                            child: const Text('Close'),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            child: const Text('Reload'),
                            onPressed: () {
                              _weather.fetchWeather().when(
                                success: (condition) {
                                  setState(() {
                                    _weatherCondition = condition;
                                  });
                                },
                                failure: (error) {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      return ErrorDialog(
                                        errorDescription: error,
                                      );
                                    },
                                  );
                                },
                              );
                            },
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
