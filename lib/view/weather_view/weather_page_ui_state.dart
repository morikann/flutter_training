import 'package:flutter_training/model/weather/weather_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_page_ui_state.freezed.dart';

@freezed
class WeatherPageUiState with _$WeatherPageUiState {
  const factory WeatherPageUiState.init() = Init;
  const factory WeatherPageUiState.success(WeatherInfo value) = Success;
  const factory WeatherPageUiState.failure(String error) = Failure;
}
