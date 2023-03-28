import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  void _toWeatherView() {
    Future.delayed(const Duration(milliseconds: 500), () {
      context.push('/weather_page').then((_) {
        _toWeatherView();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((_) {
      _toWeatherView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
