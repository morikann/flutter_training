import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/data/usecase/fetch_weather_use_case.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_weather_use_case_test.mocks.dart';

// プロバイダによるListenerへの通知を追跡する
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  group('FetchWeatherUseCase', () {
    // 成功ケース
    // repository.getWeatherからResult.success（weatherInfo）を受け取ったときに、
    // weatherInfoStateProviderのstateを受け取ったweatherInfoの値に更新する
    // weatherInfoStateProviderで管理しているstateの更新前後をテストする
    test(
      '''
        When weatherInfo is successfully returned from Repository,
        update state of weatherInfoStateProvider
      ''',
      () {
        // Arrange
        final mockRepository = MockWeatherRepository();
        const weatherInfo = WeatherInfo(
          weatherCondition: WeatherCondition.sunny,
          maxTemperature: 20,
          minTemperature: 10,
        );
        when(mockRepository.getWeather(any)).thenReturn(
          const Result.success(weatherInfo),
        );

        final container = ProviderContainer(
          overrides: [
            fetchWeatherUseCaseProvider.overrideWith(
              (ref) => FetchWeatherUseCase(mockRepository, ref),
            ),
          ],
        );
        final listener = Listener<WeatherInfo?>();

        // プロバイダを監視して変換を検出する
        container.listen<WeatherInfo?>(
          weatherInfoStateProvider,
          listener,
          fireImmediately: true,
        );

        // この時点で Listener はデフォルトの null が呼び出されているはず
        verify(listener(null, null)).called(1);
        verifyNoMoreInteractions(listener);

        // weatherPageUiStateProviderの初期ステートがnullであることを確認
        expect(
          container.read(weatherInfoStateProvider),
          null,
        );

        // Act
        container.read(fetchWeatherUseCaseProvider).fetchWeather(
              WeatherForecastTarget(
                area: 'Tokyo',
                date: DateTime.now(),
              ),
            );

        // Assert
        expect(container.read(weatherInfoStateProvider), weatherInfo);
        verify(listener(null, weatherInfo)).called(1);
        verifyNoMoreInteractions(listener);
      },
    );
  });
}
