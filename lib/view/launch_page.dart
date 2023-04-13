import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/view/weather/weather_page.dart';
import 'package:go_router/go_router.dart';

mixin AfterDisplayLayoutMixin<T extends StatefulWidget> on State<T> {
  void afterDisplayLayout();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((_) {
      afterDisplayLayout();
    });
  }
}

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  static const path = '/';

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> with AfterDisplayLayoutMixin {
  Future<void> _toWeatherView() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) {
      return;
    }
    await context.push(WeatherPage.path);
    await _toWeatherView();
  }

  @override
  void afterDisplayLayout() {
    _toWeatherView();
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
