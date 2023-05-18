import 'package:flutter/foundation.dart';

@immutable
class ErrorMessage {
  const ErrorMessage._();

  static const invalidParameter = 'パラメータが間違っています。';
  static const unknown = '予期せぬ不具合が発生しました。';
  static const other = '例外が発生しました。';
}
