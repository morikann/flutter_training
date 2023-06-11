// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_page_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherPageUiState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherPageUiInitialState value) initial,
    required TResult Function(WeatherPageUiLoadingState value) loading,
    required TResult Function(WeatherPageUiSuccessState value) success,
    required TResult Function(WeatherPageUiFailureState value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherPageUiInitialState value)? initial,
    TResult? Function(WeatherPageUiLoadingState value)? loading,
    TResult? Function(WeatherPageUiSuccessState value)? success,
    TResult? Function(WeatherPageUiFailureState value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherPageUiInitialState value)? initial,
    TResult Function(WeatherPageUiLoadingState value)? loading,
    TResult Function(WeatherPageUiSuccessState value)? success,
    TResult Function(WeatherPageUiFailureState value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherPageUiStateCopyWith<$Res> {
  factory $WeatherPageUiStateCopyWith(
          WeatherPageUiState value, $Res Function(WeatherPageUiState) then) =
      _$WeatherPageUiStateCopyWithImpl<$Res, WeatherPageUiState>;
}

/// @nodoc
class _$WeatherPageUiStateCopyWithImpl<$Res, $Val extends WeatherPageUiState>
    implements $WeatherPageUiStateCopyWith<$Res> {
  _$WeatherPageUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WeatherPageUiInitialStateCopyWith<$Res> {
  factory _$$WeatherPageUiInitialStateCopyWith(
          _$WeatherPageUiInitialState value,
          $Res Function(_$WeatherPageUiInitialState) then) =
      __$$WeatherPageUiInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherPageUiInitialStateCopyWithImpl<$Res>
    extends _$WeatherPageUiStateCopyWithImpl<$Res, _$WeatherPageUiInitialState>
    implements _$$WeatherPageUiInitialStateCopyWith<$Res> {
  __$$WeatherPageUiInitialStateCopyWithImpl(_$WeatherPageUiInitialState _value,
      $Res Function(_$WeatherPageUiInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeatherPageUiInitialState implements WeatherPageUiInitialState {
  const _$WeatherPageUiInitialState();

  @override
  String toString() {
    return 'WeatherPageUiState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherPageUiInitialState value) initial,
    required TResult Function(WeatherPageUiLoadingState value) loading,
    required TResult Function(WeatherPageUiSuccessState value) success,
    required TResult Function(WeatherPageUiFailureState value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherPageUiInitialState value)? initial,
    TResult? Function(WeatherPageUiLoadingState value)? loading,
    TResult? Function(WeatherPageUiSuccessState value)? success,
    TResult? Function(WeatherPageUiFailureState value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherPageUiInitialState value)? initial,
    TResult Function(WeatherPageUiLoadingState value)? loading,
    TResult Function(WeatherPageUiSuccessState value)? success,
    TResult Function(WeatherPageUiFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class WeatherPageUiInitialState implements WeatherPageUiState {
  const factory WeatherPageUiInitialState() = _$WeatherPageUiInitialState;
}

/// @nodoc
abstract class _$$WeatherPageUiLoadingStateCopyWith<$Res> {
  factory _$$WeatherPageUiLoadingStateCopyWith(
          _$WeatherPageUiLoadingState value,
          $Res Function(_$WeatherPageUiLoadingState) then) =
      __$$WeatherPageUiLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherPageUiLoadingStateCopyWithImpl<$Res>
    extends _$WeatherPageUiStateCopyWithImpl<$Res, _$WeatherPageUiLoadingState>
    implements _$$WeatherPageUiLoadingStateCopyWith<$Res> {
  __$$WeatherPageUiLoadingStateCopyWithImpl(_$WeatherPageUiLoadingState _value,
      $Res Function(_$WeatherPageUiLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeatherPageUiLoadingState implements WeatherPageUiLoadingState {
  const _$WeatherPageUiLoadingState();

  @override
  String toString() {
    return 'WeatherPageUiState.loading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherPageUiInitialState value) initial,
    required TResult Function(WeatherPageUiLoadingState value) loading,
    required TResult Function(WeatherPageUiSuccessState value) success,
    required TResult Function(WeatherPageUiFailureState value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherPageUiInitialState value)? initial,
    TResult? Function(WeatherPageUiLoadingState value)? loading,
    TResult? Function(WeatherPageUiSuccessState value)? success,
    TResult? Function(WeatherPageUiFailureState value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherPageUiInitialState value)? initial,
    TResult Function(WeatherPageUiLoadingState value)? loading,
    TResult Function(WeatherPageUiSuccessState value)? success,
    TResult Function(WeatherPageUiFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WeatherPageUiLoadingState implements WeatherPageUiState {
  const factory WeatherPageUiLoadingState() = _$WeatherPageUiLoadingState;
}

/// @nodoc
abstract class _$$WeatherPageUiSuccessStateCopyWith<$Res> {
  factory _$$WeatherPageUiSuccessStateCopyWith(
          _$WeatherPageUiSuccessState value,
          $Res Function(_$WeatherPageUiSuccessState) then) =
      __$$WeatherPageUiSuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeatherPageUiSuccessStateCopyWithImpl<$Res>
    extends _$WeatherPageUiStateCopyWithImpl<$Res, _$WeatherPageUiSuccessState>
    implements _$$WeatherPageUiSuccessStateCopyWith<$Res> {
  __$$WeatherPageUiSuccessStateCopyWithImpl(_$WeatherPageUiSuccessState _value,
      $Res Function(_$WeatherPageUiSuccessState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WeatherPageUiSuccessState implements WeatherPageUiSuccessState {
  const _$WeatherPageUiSuccessState();

  @override
  String toString() {
    return 'WeatherPageUiState.success()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherPageUiInitialState value) initial,
    required TResult Function(WeatherPageUiLoadingState value) loading,
    required TResult Function(WeatherPageUiSuccessState value) success,
    required TResult Function(WeatherPageUiFailureState value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherPageUiInitialState value)? initial,
    TResult? Function(WeatherPageUiLoadingState value)? loading,
    TResult? Function(WeatherPageUiSuccessState value)? success,
    TResult? Function(WeatherPageUiFailureState value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherPageUiInitialState value)? initial,
    TResult Function(WeatherPageUiLoadingState value)? loading,
    TResult Function(WeatherPageUiSuccessState value)? success,
    TResult Function(WeatherPageUiFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class WeatherPageUiSuccessState implements WeatherPageUiState {
  const factory WeatherPageUiSuccessState() = _$WeatherPageUiSuccessState;
}

/// @nodoc
abstract class _$$WeatherPageUiFailureStateCopyWith<$Res> {
  factory _$$WeatherPageUiFailureStateCopyWith(
          _$WeatherPageUiFailureState value,
          $Res Function(_$WeatherPageUiFailureState) then) =
      __$$WeatherPageUiFailureStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$WeatherPageUiFailureStateCopyWithImpl<$Res>
    extends _$WeatherPageUiStateCopyWithImpl<$Res, _$WeatherPageUiFailureState>
    implements _$$WeatherPageUiFailureStateCopyWith<$Res> {
  __$$WeatherPageUiFailureStateCopyWithImpl(_$WeatherPageUiFailureState _value,
      $Res Function(_$WeatherPageUiFailureState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$WeatherPageUiFailureState(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WeatherPageUiFailureState implements WeatherPageUiFailureState {
  _$WeatherPageUiFailureState(this.errorMessage);

  @override
  String errorMessage;

  @override
  String toString() {
    return 'WeatherPageUiState.failure(errorMessage: $errorMessage)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherPageUiFailureStateCopyWith<_$WeatherPageUiFailureState>
      get copyWith => __$$WeatherPageUiFailureStateCopyWithImpl<
          _$WeatherPageUiFailureState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) failure,
  }) {
    return failure(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? failure,
  }) {
    return failure?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeatherPageUiInitialState value) initial,
    required TResult Function(WeatherPageUiLoadingState value) loading,
    required TResult Function(WeatherPageUiSuccessState value) success,
    required TResult Function(WeatherPageUiFailureState value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeatherPageUiInitialState value)? initial,
    TResult? Function(WeatherPageUiLoadingState value)? loading,
    TResult? Function(WeatherPageUiSuccessState value)? success,
    TResult? Function(WeatherPageUiFailureState value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeatherPageUiInitialState value)? initial,
    TResult Function(WeatherPageUiLoadingState value)? loading,
    TResult Function(WeatherPageUiSuccessState value)? success,
    TResult Function(WeatherPageUiFailureState value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class WeatherPageUiFailureState implements WeatherPageUiState {
  factory WeatherPageUiFailureState(String errorMessage) =
      _$WeatherPageUiFailureState;

  String get errorMessage;
  set errorMessage(String value);
  @JsonKey(ignore: true)
  _$$WeatherPageUiFailureStateCopyWith<_$WeatherPageUiFailureState>
      get copyWith => throw _privateConstructorUsedError;
}
