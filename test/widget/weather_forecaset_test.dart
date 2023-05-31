import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/view/weather/component/weather_forecast.dart';

import 'utils/device_size.dart';

void main() {
  setUp(setUpDeviceSize);
  tearDown(tearDownDeviceSize);

  testWidgets('If weatherInfo is null, placeholder is displayed',
      (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WeatherForecast(),
        ),
      ),
    );

    expect(find.byType(Placeholder), findsOneWidget);
  });
}
