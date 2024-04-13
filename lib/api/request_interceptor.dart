import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/api/log_interceptor.dart';
import 'package:uniqcast/api/server_error.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/extensions.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

class CustomRequestInterceptor extends Interceptor {
  final LogLevel logLevel;
  final ProviderRef<Client> ref;

  const CustomRequestInterceptor(this.logLevel, this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (StorageProvider.token.safeNotEmpty) 'Authorization': 'Bearer ${StorageProvider.token}',
    };

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
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
