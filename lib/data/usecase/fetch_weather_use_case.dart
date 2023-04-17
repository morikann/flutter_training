import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page_ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_weather_use_case.g.dart';

@riverpod
FetchWeatherUseCase fetchWeatherUseCase(FetchWeatherUseCaseRef ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return FetchWeatherUseCase(weatherRepository, ref);
}

class FetchWeatherUseCase {
  const FetchWeatherUseCase(this.repository, this.ref);

  final WeatherRepository repository;
  final Ref ref;

  void getWeather(WeatherForecastTarget target) {
    final result = repository.getWeather(target);
    // ignore: cascade_invocations
    result.when(
      success: (weatherInfo) {
        ref
            .read(weatherInfoStateProvider.notifier)
            .update((state) => weatherInfo);
      },
      failure: (error) {
        ref
            .read(weatherPageUiStateProvider.notifier)
            .update((state) => WeatherPageUiState.failure(error));
      },
    );
  }
}
