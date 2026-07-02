import 'dart:io';

import 'package:dio/dio.dart';

String dioErrorMessage(DioException e) {
  // copied from _DioExceptionTypeExtension.toPrettyDescription()
  // why did they made that extension private?
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return 'connection timeed out';
    case DioExceptionType.sendTimeout:
      return 'send timed out';
    case DioExceptionType.receiveTimeout:
      return 'receive timed out';
    case DioExceptionType.badCertificate:
      return 'bad certificate';
    case DioExceptionType.badResponse:
      return 'bad response';
    case DioExceptionType.cancel:
      return 'request cancelled';
    case DioExceptionType.connectionError:
      if (e.error is SocketException) {
        return (e.error as SocketException).message;
      } else {
        return 'connection error';
      }
    case DioExceptionType.unknown:
      return 'unknown';
  }
}
