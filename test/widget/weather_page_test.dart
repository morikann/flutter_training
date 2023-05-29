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
  testWidgets(
    'Sunny image is displayed',
    (tester) async {
      // Arrange
      final binding = TestWidgetsFlutterBinding.ensureInitialized();
      await binding.setSurfaceSize(const Size(1080, 1920));
      const weatherCondition = WeatherCondition.sunny;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            // ignore: scoped_providers_should_specify_dependencies
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

  testWidgets('Cloudy image is displayed', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));
    const weatherCondition = WeatherCondition.cloudy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
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

  testWidgets('Rainy image is displayed', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));
    const weatherCondition = WeatherCondition.rainy;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
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

  testWidgets('MaxTemperature is displayed', (tester) async {
    // Arrange
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));
    const maxTemperature = 20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
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
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));
    const minTemperature = -20;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
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
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await binding.setSurfaceSize(const Size(1080, 1920));

    final mockRepository = MockWeatherRepository();
    when(mockRepository.getWeather(any)).thenReturn(
      const Result.failure(ErrorMessage.invalidParameter),
    );

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // ignore: scoped_providers_should_specify_dependencies
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
