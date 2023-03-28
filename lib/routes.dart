import 'package:flutter_training/view/launch_view.dart';
import 'package:flutter_training/view/weather_view/weather_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LaunchView(),
      routes: [
        GoRoute(
          path: 'weather_page',
          builder: (context, state) => const WeatherPage(),
        )
      ],
    ),
  ],
);
