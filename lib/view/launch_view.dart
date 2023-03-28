import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_training/view/weather_view.dart';

class LaunchView extends StatefulWidget {
  const LaunchView({super.key});

  @override
  State<LaunchView> createState() => _LaunchViewState();
}

class _LaunchViewState extends State<LaunchView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).push(
          MaterialPageRoute<WeatherView>(
            builder: (context) => const WeatherView(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green);
  }
}
