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
      log('Request Headers: ${options.headers}');
    } else {
      log('Request Authorization: ${options.headers['Authorization']}');
    }

    final String message = 'Request data: ${options.data}';

    if (logLevel == LogLevel.basic) {
      log(message.substring(0, min(message.length - 1, 500)));
    } else {
      log(message);
    }

    if (logLevel == LogLevel.basic) log('Request Authorization: ${options.headers['Authorization']}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (logLevel == LogLevel.none) return super.onResponse(response, handler);

    log('Response<--- ${response.requestOptions.method.toUpperCase()} ${response.requestOptions.uri} '
        'StatusCode: ${response.statusCode}');

    print('type = ${response.data.runtimeType}');
    if (logLevel != LogLevel.basic) log('Data: ${response.data}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (logLevel == LogLevel.none) return super.onError(err, handler);

    log('Caught error');
    if (err.response != null) {
      log('Response<--- ${err.response!.requestOptions.method.toUpperCase()} ${err.response!.requestOptions.uri} '
          'StatusCode: ${err.response!.statusCode}');

      log('data: ${err.response!.data}');
      log('Headers ${err.response!.headers}');
      log('message ${err.message}');

      if (err.response!.statusCode == 401) {
        StorageProvider.logOut();
        ref.invalidate(routerProvider);
      }

      return super.onError(err.copyWith(error: ServerError.fromJson(err.response!.data)), handler);

      // throw (ServerError.fromJson(err.response!.data));
    } else {
      log('caught error with message: ${err.message}');
      return super.onError(err, handler);
    }
  }
}
