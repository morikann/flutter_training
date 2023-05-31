// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/common/constants/error_message.dart';
import 'package:flutter_training/common/result.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/data/usecase/fetch_weather_use_case.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';
import 'package:flutter_training/view/weather/weather_page.dart';
import 'package:mockito/mockito.dart';

import '../unit/usecase/fetch_weather_use_case_test.mocks.dart';
import 'utils/device_size.dart';

Finder findSvgImage(String assetName) {
  return find.byWidgetPredicate(
    (widget) =>
        widget is SvgPicture &&
        (widget.bytesLoader as SvgAssetLoader) // Here!
                .assetName ==
            assetName,
  );
}

MockWeatherRepository createMockWeaherRepository({
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
  when(mockRepository.getWeather(any)).thenReturn(
    Result.success(weatherInfo),
  );
  return mockRepository;
}

void main() {
  setUp(setUpDeviceSize);
  tearDown(tearDownDeviceSize);

  testWidgets(
    '''
      When weatherInfo containing WeatherCondition.sunny is returned from repository, 
      display sunny image
    ''',
    (tester) async {
      // Arrange
      const weatherCondition = WeatherCondition.sunny;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            fetchWeatherUseCaseProvider.overrideWith(
              (ref) => FetchWeatherUseCase(
                createMockWeaherRepository(),
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

      await tester.pump();

      // Assert
      expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);
    },
  );

  testWidgets('''
      When weatherInfo containing WeatherCondition.cloudy is returned from repository, 
      display cloudy image
    ''', (tester) async {
    // Arrange
    const weatherCondition = WeatherCondition.cloudy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWith(
            (ref) => FetchWeatherUseCase(
              createMockWeaherRepository(weatherCondition: weatherCondition),
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

    await tester.pump();

    // Assert
    expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);
  });

  testWidgets('''
      When weatherInfo containing WeatherCondition.rainy is returned from repository, 
      display rainy image
    ''', (tester) async {
    // Arrange
    const weatherCondition = WeatherCondition.rainy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWith(
            (ref) => FetchWeatherUseCase(
              createMockWeaherRepository(weatherCondition: weatherCondition),
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

    await tester.pump();

    // Assert
    expect(findSvgImage(weatherCondition.svgImagePath), findsOneWidget);
  });

  testWidgets('''
      When a weatherInfo containing maxTemperature is returned from the repository, 
      the text of the maxTemeprature is displayed
    ''', (tester) async {
    // Arrange
    const maxTemperature = 20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWith(
            (ref) => FetchWeatherUseCase(
              createMockWeaherRepository(maxTemperature: maxTemperature),
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

    await tester.pump();

    // Assert
    expect(find.text('$maxTemperature ℃'), findsOneWidget);
  });

  testWidgets('MinTemperature is displayed', (tester) async {
    // Arrange
    const minTemperature = -20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWith(
            (ref) => FetchWeatherUseCase(
              createMockWeaherRepository(maxTemperature: minTemperature),
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

    await tester.pump();

    // Assert
    expect(find.text('$minTemperature ℃'), findsOneWidget);
  });

  testWidgets('Dialog appears with a specific message', (tester) async {
    // Arrange
    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenReturn(
      const Result.failure(ErrorMessage.invalidParameter),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          fetchWeatherUseCaseProvider.overrideWith(
            (ref) => FetchWeatherUseCase(
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

    await tester.pump();

    // Assert
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('エラー'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
    expect(find.text(ErrorMessage.invalidParameter), findsOneWidget);
  });
}
