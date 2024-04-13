import 'dart:developer';
import 'dart:math' hide log;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:uniqcast/api/server_error.dart';

enum LogLevel {
  /// No logs will be shown
  none,

  /// Shows AUTHORIZATION [Header] and only the FIRST 500 CHARS of the [body]
  basic,

  /// Shows AUTHORIZATION [Header] and the FULL [body]
  fullBody,

  /// Shows full [HEADER] and FULL [body]
  full;
}

class CustomLogInterceptor extends Interceptor {
  final LogLevel logLevel;
  const CustomLogInterceptor(this.logLevel);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (logLevel == LogLevel.none) return super.onRequest(options, handler);

    log('Request---> ${options.method.toUpperCase()} ${options.uri} ');

    if (logLevel == LogLevel.full) {
      log('Request Headers---> ${options.headers}');
    } else {
      log('Request Authorization---> ${options.headers['Authorization']}');
    }

    final String message = 'Request Data---> ${options.data}';

    if (logLevel == LogLevel.basic) {
      log(message.substring(0, min(message.length, 500)));
    } else {
      log(message);
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (logLevel == LogLevel.none) return super.onResponse(response, handler);

    log('Response StatusCode<--- ${response.statusCode} Type<--- ${response.data.runtimeType} '
        '${response.requestOptions.method.toUpperCase()} ${response.requestOptions.uri}');

    final String message = 'Response Data<--- ${response.data}';

    if (response.data is Uint8List) {
      log('Response Data<---Uint8List (byte data)');
    } else if (logLevel == LogLevel.basic) {
      log(message.substring(0, min(message.length, 500)));
    } else {
      log(message);
    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (logLevel == LogLevel.none) return super.onError(err, handler);

    log('Error---Response');
    if (err.response != null) {
      log('Error---StatusCode<--- ${err.response!.statusCode} Type<--- ${err.response!.data.runtimeType} '
          '${err.response!.requestOptions.method.toUpperCase()} ${err.response!.requestOptions.uri}');

      final String message = 'Error---Data<--- ${err.response!.data}';

      if (logLevel == LogLevel.basic) {
        log(message.substring(0, min(message.length, 500)));
      } else {
        log(message);
      }

      if (logLevel != LogLevel.basic) log('Error data---${err.response!.data}');

      return super.onError(err.copyWith(error: ServerError.fromJson(err.response!.data)), handler);
    } else {
      log('caught error with message: ${err.message}');
      return super.onError(err, handler);
    }
  }
}
