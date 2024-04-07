import 'package:get_storage/get_storage.dart';

abstract class StorageProvider {
  static final _storage = GetStorage();

  // Keys
  static String get _tokenKey => 'token';
  static String get _tokenExpiryDateKey => 'token';

  // Getters
  static String? get token => _storage.read(_tokenKey);
  static DateTime? get expiryDate {
    final maybeDate = _storage.read(_tokenKey);
    if (maybeDate == null) return null;
    return DateTime.parse(maybeDate).toLocal();
  }

  // Setters
  static void setToken(String? newToken) => _storage.write(_tokenKey, newToken);
  static void setExpiryDate(DateTime? newTokenExpiryDate) =>
      _storage.write(_tokenExpiryDateKey, newTokenExpiryDate?.toUtc().toString());
}
