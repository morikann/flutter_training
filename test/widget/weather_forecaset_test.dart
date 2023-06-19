import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/model/weather/weather_condition.dart';
import 'package:flutter_training/data/model/weather/weather_info.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';

import 'utils/device_size.dart';

void main() {
  testWidgets('If weatherInfo is null, placeholder is displayed',
      (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WeatherForecast(),
        ),
      ),
    );

    expect(find.byType(Placeholder), findsOneWidget);

    // teardown
    await tearDownDeviceSize(binding);
  });

  testWidgets('If weatherInfo is null, two ** ℃ texts are displayed',
      (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WeatherForecast(),
        ),
      ),
    );

    expect(find.text('** ℃'), findsNWidgets(2));

    // teardown
    await tearDownDeviceSize(binding);
  });

  testWidgets('The color of the maxTemperature is Colors.red', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherInfoStateProvider.overrideWith(
            (ref) => const WeatherInfo(
              weatherCondition: WeatherCondition.sunny,
              maxTemperature: 20,
              minTemperature: -10,
            ),
          ),
        ],
        child: const MaterialApp(
          home: WeatherForecast(),
        ),
      ),
    );

    final maxTemperature = find.text('20 ℃');
    expect(maxTemperature, findsOneWidget);

    final textWidget = tester.firstWidget(maxTemperature) as Text;
    expect(textWidget.style!.color, Colors.red);

    // teardown
    await tearDownDeviceSize(binding);
  });

  testWidgets('The color of the minTemperature is Colors.blue', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          weatherInfoStateProvider.overrideWith(
            (ref) => const WeatherInfo(
              weatherCondition: WeatherCondition.sunny,
              maxTemperature: 20,
              minTemperature: -10,
            ),
          ),
        ],
        child: const MaterialApp(
          home: WeatherForecast(),
        ),
      ),
    );

    final maxTemperature = find.text('-10 ℃');
    expect(maxTemperature, findsOneWidget);

    final textWidget = tester.firstWidget(maxTemperature) as Text;
    expect(textWidget.style!.color, Colors.blue);

    // teardown
    await tearDownDeviceSize(binding);
  });
}
