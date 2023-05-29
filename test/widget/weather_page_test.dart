import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
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

MockWeatherRepository createMockWeaherRepository(
  WeatherCondition weatherCondition,
) {
  final mockRepository = MockWeatherRepository();
  final weatherInfo = WeatherInfo(
    weatherCondition: weatherCondition,
    maxTemperature: 20,
    minTemperature: 10,
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
                createMockWeaherRepository(weatherCondition),
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
}
