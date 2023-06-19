import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page_ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_use_case.g.dart';

@riverpod
WeatherUseCase weatherUseCase(WeatherUseCaseRef ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return WeatherUseCase(weatherRepository, ref);
}

class WeatherUseCase {
  const WeatherUseCase(this.repository, this.ref);

  final WeatherRepository repository;
  final Ref ref;

  Future<void> fetchWeather(WeatherForecastTarget target) async {
    // startLoading
    ref
        .read(weatherPageUiStateProvider.notifier)
        .update((state) => const WeatherPageUiState.loading());

    final result = await repository.getWeather(target);

    // ignore: cascade_invocations
    result.when(
      success: (weatherInfo) {
        ref.read(weatherPageUiStateProvider.notifier).update(
              (state) => const WeatherPageUiState.success(),
            );
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
