import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_page_ui_state.freezed.dart';

// // WeatherPageの状態を返すプロバイダ
final weatherPageUiStateProvider = StateProvider((ref) {
  return const WeatherPageUiState.init();
});

@unfreezed
class WeatherPageUiState with _$WeatherPageUiState {
  const factory WeatherPageUiState.init() = Init;
  factory WeatherPageUiState.failure(String errorMessage) = Failure;
}
