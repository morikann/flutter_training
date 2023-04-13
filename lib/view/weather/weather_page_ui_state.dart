import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_page_ui_state.freezed.dart';

// // WeatherPageの状態を返すプロバイダ
final weatherPageUiStateProvider = StateProvider((ref) {
  return const WeatherPageUiState.init();
});

@freezed
class WeatherPageUiState with _$WeatherPageUiState {
  const factory WeatherPageUiState.init() = Init;
  const factory WeatherPageUiState.failure(String error) = Failure;
}
