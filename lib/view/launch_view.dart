import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/view/weather_view/weather_page.dart';
import 'package:go_router/go_router.dart';

mixin AfterDisplayLayoutMixin<T extends StatefulWidget> on State<T> {
  void transitScreen() {}

  void afterDisplayLayout() {
    WidgetsBinding.instance.endOfFrame.then((_) {
      transitScreen();
    });
  }
}

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  static const path = '/';

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> with AfterDisplayLayoutMixin {
  Future<void> _toWeatherView() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) {
      return;
    }
    await context.push(WeatherPage.path);
    await _toWeatherView();
  }

  @override
  void transitScreen() {
    super.transitScreen();

    _toWeatherView();
  }

  @override
  void initState() {
    super.initState();

    afterDisplayLayout();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
