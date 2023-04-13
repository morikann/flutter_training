import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/repository/weather_repository.dart';
import 'package:flutter_training/view/weather_view/component/weather_forecast.dart';
import 'package:flutter_training/view/weather_view/weather_page_ui_state.dart';

final fetchWeatherUseCaseProvider = Provider((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  return FetchWeatherUseCase(weatherRepository, ref);
});

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
