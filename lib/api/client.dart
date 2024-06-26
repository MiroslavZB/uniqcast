import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/factories.dart';
import 'package:uniqcast/api/request_interceptor.dart';
import 'package:uniqcast/api/log_interceptor.dart';
import 'package:uniqcast/utils/extensions.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

final clientProvider = Provider<Client>((ref) => Client(ref));

class Client {
  final ProviderRef<Client> ref;
  Client(this.ref);

  // Logging
  LogLevel get _logLevel => LogLevel.fullBody;

  // Client
  String get _baseUrl => 'https://office-new-dev.uniqcast.com:12611/api/client';

  Dio get _dio => Dio(BaseOptions(baseUrl: _baseUrl))
    ..interceptors.addAll(
      [
        CustomRequestInterceptor(_logLevel, ref),
        CustomLogInterceptor(_logLevel),
      ],
    );

  // Methods
  Future<T> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (StorageProvider.token.safeNotEmpty) 'Authorization': 'Bearer ${StorageProvider.token}',
    };
    return _dio.get(path, queryParameters: queryParams).then((value) => _handleResponse<T>(value));
  }

  Future<T> post<T>(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParams}) async =>
      _dio.post(path, data: body, queryParameters: queryParams).then((value) => _handleResponse<T>(value));

  Future<T> put<T>(String path, {required Map<String, dynamic> body}) async =>
      _dio.get(path, data: body).then((value) => _handleResponse<T>(value));

  Future<T> delete<T>(String path) async => _dio.delete(path).then((value) => _handleResponse<T>(value));

  // Handlers
  T _handleResponse<T>(Response<dynamic> response) {
    final responseData = response.data;

    if (responseData.runtimeType == T) return responseData;

    if (responseData is! Map<String, dynamic>) throw ('Wrong format $responseData');

    final jsonFactory = factories[T];

    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw ('$T is not Serializable');
    }

    return jsonFactory(responseData['data']);
  }

  Future<File?> downloadFile({
    required String savePath,
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Response response = await _dio.get(
        endPoint,
        queryParameters: queryParams,
        options: Options(responseType: ResponseType.bytes, followRedirects: false),
      );

      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;

      final String path = '$appDocPath/$savePath';

      File file = File(path);
      final RandomAccessFile raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data as List<int>);
      await raf.close();
      return file;
    } on DioException catch (e, s) {
      log('Downloading file from $endPoint with $queryParams caught DioException: ${e.error} $s');
    } catch (e, s) {
      log('Downloading file from $endPoint with $queryParams caught an error: $e $s');
    }

    return null;
  }

  Future<Uint8List?> downloadFileForWeb({
    required String savePath,
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      if (!kIsWeb) return null;
      Response response = await _dio.get(
        endPoint,
        queryParameters: queryParams,
        options: Options(responseType: ResponseType.bytes, followRedirects: false),
      );

      return response.data as Uint8List;
    } on DioException catch (e, s) {
      log('2Downloading Web file from $endPoint with $queryParams caught DioException: ${e.error} $s');
    } catch (e, s) {
      log('1Downloading Web file from $endPoint with $queryParams caught an error: $e $s');
    }

    return null;
  }
}
