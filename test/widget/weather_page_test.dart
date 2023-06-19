// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/constants/error_message.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/usecase/weather_use_case.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page.dart';
import 'package:mockito/mockito.dart';

import '../unit/usecase/weather_use_case_test.mocks.dart';
import 'utils/device_size.dart';
import 'utils/svg_image.dart';

MockWeatherRepository createMockWeatherRepository({
  WeatherCondition weatherCondition = WeatherCondition.sunny,
  int maxTemperature = 0,
  int minTemperature = 0,
}) {
  final mockRepository = MockWeatherRepository();
  final weatherInfo = WeatherInfo(
    weatherCondition: weatherCondition,
    maxTemperature: maxTemperature,
    minTemperature: minTemperature,
  );
  when(mockRepository.getWeather(any)).thenAnswer(
    (_) async => Result.success(weatherInfo),
  );
  return mockRepository;
}

void main() {
  testWidgets(
    '''
      When weatherInfo containing WeatherCondition.sunny is returned from repository,
      display sunny image
    ''',
    (tester) async {
      // Arrange
      final binding = TestWidgetsFlutterBinding.ensureInitialized();
      await setUpDeviceSize(binding);
      const weatherCondition = WeatherCondition.sunny;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            weatherUseCaseProvider.overrideWith(
              (ref) => WeatherUseCase(
                createMockWeatherRepository(),
                ref,
              ),
            )
          ],
          child: const MaterialApp(
            home: WeatherPage(),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Reload'));

      await tester.pumpAndSettle();

      // Assert
      expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);

      // tearDown
      await tearDownDeviceSize(binding);
    },
  );

  testWidgets('''
      When weatherInfo containing WeatherCondition.cloudy is returned from repository,
      display cloudy image
    ''', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    const weatherCondition = WeatherCondition.cloudy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              createMockWeatherRepository(weatherCondition: weatherCondition),
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pumpAndSettle();

    // Assert
    expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);

    // tearDown
    await tearDownDeviceSize(binding);
  });

  testWidgets('''
      When weatherInfo containing WeatherCondition.rainy is returned from repository,
      display rainy image
    ''', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    const weatherCondition = WeatherCondition.rainy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              createMockWeatherRepository(weatherCondition: weatherCondition),
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pumpAndSettle();

    // Assert
    expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);

    // tearDown
    await tearDownDeviceSize(binding);
  });

  testWidgets('''
      When a weatherInfo containing maxTemperature is returned from the repository,
      the text of the maxTemperature is displayed
    ''', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    const maxTemperature = 20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              createMockWeatherRepository(maxTemperature: maxTemperature),
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pumpAndSettle();

    // Assert
    expect(find.text('$maxTemperature ℃'), findsOneWidget);

    // tearDown
    await tearDownDeviceSize(binding);
  });

  testWidgets('''
      When a weatherInfo containing minTemperature is returned from the repository,
      the text of the minTemperature is displayed
    ''', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    const minTemperature = -20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              createMockWeatherRepository(maxTemperature: minTemperature),
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pumpAndSettle();

    // Assert
    expect(find.text('$minTemperature ℃'), findsOneWidget);
    // tearDown
    await tearDownDeviceSize(binding);
  });

  testWidgets('''
      When ErrorMessage.invalidParameter is returned from the repository,
      display an AlertDialog containing the message of ErrorMessage.invalidParameter
    ''', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenAnswer(
      (_) async => const Result.failure(ErrorMessage.invalidParameter),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              mockRepository,
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('エラー'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    expect(find.text(ErrorMessage.invalidParameter), findsOneWidget);

    await tearDownDeviceSize(binding);
  });

  testWidgets('show CircularProgressIndicator during fetching data',
      (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenAnswer((_) async {
      // １秒間loadingIndicatorを表示する
      await Future<void>.delayed(const Duration(seconds: 1));
      return const Result.failure(ErrorMessage.invalidParameter);
    });

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherUseCaseProvider.overrideWith(
            (ref) => WeatherUseCase(
              mockRepository,
              ref,
            ),
          )
        ],
        child: const MaterialApp(
          home: WeatherPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Act
    await tester.tap(find.text('Reload'));

    await tester.pump(const Duration(microseconds: 500));

    // Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // timerがpending状態だとエラーが起きるのでpumpAndSettleでフレーム生成を終了させる
    await tester.pumpAndSettle();
    // teardown
    await tearDownDeviceSize(binding);
  });
}
