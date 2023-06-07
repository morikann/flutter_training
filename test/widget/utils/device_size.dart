import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Change the device size of the widget test
// because the default device size is Size(800.0, 600.0) and it is horizontal.
void setUpDeviceSize() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.physicalSizeTestValue = const Size(1080, 1920);
  binding.window.devicePixelRatioTestValue = 1;
}

void tearDownDeviceSize() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();
  binding.window.clearPhysicalSizeTestValue();
  binding.window.clearDevicePixelRatioTestValue();
}
