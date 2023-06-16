import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/constants/error_message.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_forecast_target.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/data/usecase/weather_use_case.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page_ui_state.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weather_use_case_test.mocks.dart';

// プロバイダによるListenerへの通知を追跡する
class Listener<T> extends Mock {
  void call(T? previous, T? value);
}

@GenerateNiceMocks([MockSpec<WeatherRepository>()])
void main() {
  // Arrange
  final mockRepository = MockWeatherRepository();

  // 成功ケース
  // repository.getWeatherからResult.success（weatherInfo）を受け取ったときに、
  // weatherInfoStateProviderのstateを受け取ったweatherInfoの値に更新する
  // weatherInfoStateProviderで管理しているstateの更新前後をテストする
  test(
    '''
        When weatherInfo is successfully returned from Repository,
        update state of weatherInfoStateProvider
      ''',
    () async {
      // Arrange
      const weatherInfo = WeatherInfo(
        weatherCondition: WeatherCondition.sunny,
        maxTemperature: 20,
        minTemperature: 10,
      );
      when(mockRepository.getWeather(any)).thenAnswer(
        (_) async => const Result.success(weatherInfo),
      );

      final container = ProviderContainer(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(mockRepository, ref),
          ),
        ],
      );
      addTearDown(container.dispose);

      final weatherInfoListener = Listener<WeatherInfo?>();
      // プロバイダを監視して変更を検出する
      container.listen<WeatherInfo?>(
        weatherInfoStateProvider,
        weatherInfoListener,
        fireImmediately: true,
      );

      final weatherPageUiStateListener = Listener<WeatherPageUiState>();
      container.listen<WeatherPageUiState>(
        weatherPageUiStateProvider,
        weatherPageUiStateListener,
        fireImmediately: true,
      );

      // この時点で Listener はデフォルトの null が呼び出されているはず
      verify(weatherInfoListener(null, null)).called(1);
      verifyNoMoreInteractions(weatherInfoListener);

      // weatherPageUiStateProviderの初期ステートがnullであることを確認
      expect(
        container.read(weatherInfoStateProvider),
        null,
      );

      // Act
      await container.read(weatherUseCaseProvider).fetchWeather(
            WeatherForecastTarget(
              area: 'Tokyo',
              date: DateTime.now(),
            ),
          );

      // Assert
      expect(container.read(weatherInfoStateProvider), weatherInfo);
      verify(weatherInfoListener(null, weatherInfo)).called(1);
      verifyNoMoreInteractions(weatherInfoListener);

      verifyInOrder([
        weatherPageUiStateListener(
          null,
          const WeatherPageUiState.initial(),
        ),
        weatherPageUiStateListener(
          const WeatherPageUiState.initial(),
          const WeatherPageUiState.loading(),
        ),
        weatherPageUiStateListener(
          const WeatherPageUiState.loading(),
          const WeatherPageUiState.success(),
        ),
      ]);
      verifyNoMoreInteractions(weatherPageUiStateListener);
    },
  );
  // 失敗ケース1
  // Result.failure(error)が返ってきた時に、WeatherPageUiStateProviderの
  // state(WeatherPageUiState)を受け取ったエラーメッセージの値
  // （'パラメータが間違っています。'）で更新する
  test('''
      When Result.failure('パラメータが間違っています。') is returned,
      update WeatherPageUiStateProvider state with the error message received
    ''', () async {
    // Arrange
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenAnswer(
      (_) async => const Result.failure(ErrorMessage.invalidParameter),
    );

    final container = ProviderContainer(
      overrides: [
        weatherUseCaseProvider.overrideWith(
          (ref) => WeatherUseCase(mockRepository, ref),
        ),
      ],
    );
    addTearDown(container.dispose);

    final weatherPageUiStateListener = Listener<WeatherPageUiState>();
    container.listen<WeatherPageUiState>(
      weatherPageUiStateProvider,
      weatherPageUiStateListener,
      fireImmediately: true,
    );

    final weatherInfoListener = Listener<WeatherInfo?>();
    container.listen<WeatherInfo?>(
      weatherInfoStateProvider,
      weatherInfoListener,
      fireImmediately: true,
    );

    verify(
      weatherPageUiStateListener(
        null,
        const WeatherPageUiState.initial(),
      ),
    ).called(1);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.initial(),
    );

    // Act
    await container.read(weatherUseCaseProvider).fetchWeather(
          WeatherForecastTarget(
            area: 'Tokyo',
            date: DateTime.now(),
          ),
        );

    // Assert
    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.failure(ErrorMessage.invalidParameter),
    );

    verifyInOrder([
      weatherPageUiStateListener(
        const WeatherPageUiState.initial(),
        const WeatherPageUiState.loading(),
      ),
      weatherPageUiStateListener(
        const WeatherPageUiState.loading(),
        const WeatherPageUiState.failure(ErrorMessage.invalidParameter),
      ),
    ]);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    verify(
      weatherInfoListener(null, null),
    ).called(1);
    verifyNoMoreInteractions(weatherInfoListener);
  });

  // 失敗ケース2
  // Result.failure(error)が返ってきた時に、WeatherPageUiStateProviderの
  // state(WeatherPageUiState)を受け取ったエラーメッセージの値
  // （'予期せぬ不具合が発生しました。'）で更新する
  test('''
      When Result.failure('予期せぬ不具合が発生しました。') is returned,
      update WeatherPageUiStateProvider state with the error message received
    ''', () async {
    // Arrange
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenAnswer(
      (_) async => const Result.failure(ErrorMessage.unknown),
    );

    final container = ProviderContainer(
      overrides: [
        weatherUseCaseProvider.overrideWith(
          (ref) => WeatherUseCase(mockRepository, ref),
        ),
      ],
    );
    addTearDown(container.dispose);

    final weatherPageUiStateListener = Listener<WeatherPageUiState>();
    container.listen<WeatherPageUiState>(
      weatherPageUiStateProvider,
      weatherPageUiStateListener,
      fireImmediately: true,
    );

    final weatherInfoListener = Listener<WeatherInfo?>();
    container.listen<WeatherInfo?>(
      weatherInfoStateProvider,
      weatherInfoListener,
      fireImmediately: true,
    );

    verify(
      weatherPageUiStateListener(
        null,
        const WeatherPageUiState.initial(),
      ),
    ).called(1);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.initial(),
    );

    // Act
    await container.read(weatherUseCaseProvider).fetchWeather(
          WeatherForecastTarget(
            area: 'Tokyo',
            date: DateTime.now(),
          ),
        );

    // Assert
    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.failure(ErrorMessage.unknown),
    );

    verifyInOrder([
      weatherPageUiStateListener(
        const WeatherPageUiState.initial(),
        const WeatherPageUiState.loading(),
      ),
      weatherPageUiStateListener(
        const WeatherPageUiState.loading(),
        const WeatherPageUiState.failure(ErrorMessage.unknown),
      ),
    ]);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    verify(
      weatherInfoListener(null, null),
    ).called(1);
    verifyNoMoreInteractions(weatherInfoListener);
  });

  // 失敗ケース3
  // Result.failure(error)が返ってきた時に、WeatherPageUiStateProviderの
  // state(WeatherPageUiState)を受け取ったエラーメッセージの値
  // （'例外が発生しました。'）で更新する
  test('''
      When Result.failure('例外が発生しました。') is returned,
      update WeatherPageUiStateProvider state with the error message received
    ''', () async {
    // Arrange
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenAnswer(
      (_) async => const Result.failure(ErrorMessage.other),
    );

    final container = ProviderContainer(
      overrides: [
        weatherUseCaseProvider.overrideWith(
          (ref) => WeatherUseCase(mockRepository, ref),
        ),
      ],
    );
    addTearDown(container.dispose);

    final weatherPageUiStateListener = Listener<WeatherPageUiState>();
    container.listen<WeatherPageUiState>(
      weatherPageUiStateProvider,
      weatherPageUiStateListener,
      fireImmediately: true,
    );

    final weatherInfoListener = Listener<WeatherInfo?>();
    container.listen<WeatherInfo?>(
      weatherInfoStateProvider,
      weatherInfoListener,
      fireImmediately: true,
    );

    verify(
      weatherPageUiStateListener(
        null,
        const WeatherPageUiState.initial(),
      ),
    ).called(1);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.initial(),
    );

    // Act
    await container.read(weatherUseCaseProvider).fetchWeather(
          WeatherForecastTarget(
            area: 'Tokyo',
            date: DateTime.now(),
          ),
        );

    // Assert
    expect(
      container.read(weatherPageUiStateProvider),
      const WeatherPageUiState.failure(ErrorMessage.other),
    );

    verifyInOrder([
      weatherPageUiStateListener(const WeatherPageUiState.initial(),
          const WeatherPageUiState.loading()),
      weatherPageUiStateListener(
        const WeatherPageUiState.loading(),
        const WeatherPageUiState.failure(ErrorMessage.other),
      ),
    ]);
    verifyNoMoreInteractions(weatherPageUiStateListener);

    verify(weatherInfoListener(null, null)).called(1);
    verifyNoMoreInteractions(weatherInfoListener);
  });
}
