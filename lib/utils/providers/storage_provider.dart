import 'package:get_storage/get_storage.dart';

abstract class StorageProvider {
  static final _storage = GetStorage();

  // Keys
  static String get _tokenKey => 'token';

  // Getters
  static String? get token => _storage.read(_tokenKey);

  // Setters
  static void setToken(String? token) => _storage.write(_tokenKey, token);
}
