import 'dart:developer';
import 'dart:math' hide log;

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/api/server_error.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

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
  final ProviderRef<Client> ref;
  const CustomLogInterceptor(this.logLevel, this.ref);

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

    if (logLevel == LogLevel.basic) {
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
      log('Error---StatusCode<--- ${err.response!.statusCode} type<--- ${err.response!.data.runtimeType} '
          '${err.response!.requestOptions.method.toUpperCase()} ${err.response!.requestOptions.uri}');

      final String message = 'Error---Data<--- ${err.response!.data}';

      if (logLevel == LogLevel.basic) {
        log(message.substring(0, min(message.length, 500)));
      } else {
        log(message);
      }

      if (logLevel != LogLevel.basic) log('Error data---${err.response!.data}');

      if (logLevel == LogLevel.full) {
        log('Error---Headers---> ${err.response!.headers}');
      } else {
        log('Error---Authorization---> ${err.response!.headers['Authorization']}');
      }

      if (err.response!.statusCode == 401) {
        StorageProvider.logOut();
        ref.invalidate(routerProvider);
      }

      return super.onError(err.copyWith(error: ServerError.fromJson(err.response!.data)), handler);
    } else {
      log('caught error with message: ${err.message}');
      return super.onError(err, handler);
    }
  }
}
