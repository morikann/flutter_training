import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/usecase/fetch_weather_use_case.dart';
import 'package:flutter_training/view/component/error_dialog.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page_ui_state.dart';
import 'package:go_router/go_router.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  static const path = '/weather_page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
        weatherPageUiStateProvider.select(
          (value) => value.mapOrNull(
            failure: (error) => error,
          ),
        ), (_, error) {
      if (error == null) {
        return;
      }
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return ErrorDialog(
            errorDescription: error.errorMessage,
          );
        },
      );
    });

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              const WeatherForecast(),
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
                            onPressed: () {
                              ref
                                  .read(fetchWeatherUseCaseProvider)
                                  .fetchWeather(
                                    WeatherForecastTarget(
                                      area: 'Tokyo',
                                      date: DateTime.now(),
                                    ),
                                  );
                            },
                            child: const Text('Reload'),
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
