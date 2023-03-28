import 'package:flutter/material.dart';
import 'package:flutter_training/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
