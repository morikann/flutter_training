import 'package:flutter_training/view/launch_page.dart';
import 'package:flutter_training/view/weather/weather_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: LaunchPage.path,
      builder: (context, state) => const LaunchPage(),
    ),
    GoRoute(
      path: WeatherPage.path,
      builder: (context, state) => const WeatherPage(),
    )
  ],
);
