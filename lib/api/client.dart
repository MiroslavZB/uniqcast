import 'package:dio/dio.dart';
import 'package:uniqcast/api/headers_interceptor.dart';
import 'package:uniqcast/api/log_interceptor.dart';
import 'package:uniqcast/modules/authentication/login_response.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

abstract class Client {
  // Logging
  static LogLevel get _logLevel => LogLevel.full;

  // Factories for conversion
  static final Map<Type, JsonFactory> _factories = {
    LoginResponse: LoginResponse.fromJson,
  };

  // Client
  static String get _baseUrl => 'https://office-new-dev.uniqcast.com:12611/api/client/v2';

  static final Dio _dio = Dio(BaseOptions(baseUrl: _baseUrl))
    ..interceptors.addAll(
      [
        CustomLogInterceptor(_logLevel),
        CustomRequestInterceptor(_logLevel),
      ],
    );

  // Methods
  static Future<T> get<T>(String path) async => _dio.get(path).then((value) => _handleResponse<T>(value));

  static Future<T> post<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParams}) async =>
      _dio.post(path, data: body, queryParameters: queryParams).then((value) => _handleResponse<T>(value));

  static Future<T> put<T>(String path, {required Map<String, dynamic> body}) async =>
      _dio.get(path, data: body).then((value) => _handleResponse<T>(value));

  static Future<T> delete<T>(String path) async => _dio.delete(path).then((value) => _handleResponse<T>(value));

  // Handlers
  static T _handleResponse<T>(Response<dynamic> response) {
    final json = response.data;

    if (json is! Map<String, dynamic>) throw ('Wrong format $json');

    final jsonFactory = _factories[T];

    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw ('$T is not Serializable');
    }

    return jsonFactory(json['data']);
  }
}
