import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Change the device size of the widget test
// because the default device size is Size(800.0, 600.0) and it is horizontal.
Future<void> setUpDeviceSize(TestWidgetsFlutterBinding binding) async {
  await binding.setSurfaceSize(const Size(1080, 1920));
}

Future<void> tearDownDeviceSize(TestWidgetsFlutterBinding binding) async {
  await binding.setSurfaceSize(null);
}
