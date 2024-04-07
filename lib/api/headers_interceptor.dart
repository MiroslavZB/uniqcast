import 'package:dio/dio.dart';
import 'package:uniqcast/api/log_interceptor.dart';
import 'package:uniqcast/utils/extensions.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

class CustomRequestInterceptor extends Interceptor {
  final LogLevel logLevel;
  const CustomRequestInterceptor(this.logLevel);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (StorageProvider.token.safeNotEmpty) 'Authorization': 'Bearer ${StorageProvider.token}',
    };

    // TODO format options.data toJson()

    return super.onRequest(options, handler);
  }
}
