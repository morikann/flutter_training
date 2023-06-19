import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/app.dart';
import 'package:flutter_training/view/launch_page.dart';
import 'package:flutter_training/view/weather/weather_page.dart';

import 'utils/device_size.dart';

void main() {
  testWidgets('''
      Transition from LaunchPage to WeatherPage 
      after 500ms of application launch
    ''', (tester) async {
    final binding = TestWidgetsFlutterBinding.ensureInitialized();
    await setUpDeviceSize(binding);

    await tester.pumpWidget(
      const ProviderScope(
        child: App(),
      ),
    );

    expect(find.byType(LaunchPage), findsOneWidget);
    expect(find.byType(WeatherPage), findsNothing);

    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    expect(find.byType(WeatherPage), findsOneWidget);
    expect(find.byType(LaunchPage), findsNothing);

    // teardown
    await tearDownDeviceSize(binding);
  });
}
