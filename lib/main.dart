import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // デバイス向きを縦に固定
  ]);
  
  runApp(const App());
}
