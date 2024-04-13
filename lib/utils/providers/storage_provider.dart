import 'package:get_storage/get_storage.dart';
import 'package:uniqcast/modules/authentication/user_model.dart';

abstract class StorageProvider {
  static void logOut() {
    setToken(null);
    setExpiryDate(null);
    setUser(null);
  }

  static final _storage = GetStorage();

  // Keys
  static String get _tokenKey => 'token';
  static String get _tokenExpiryDateKey => 'token-expiry-date';
  static String get _userKey => 'user';

  // Getters
  static String? get token => _storage.read(_tokenKey);

  static DateTime? get expiryDate {
    final maybeDate = _storage.read(_tokenExpiryDateKey);
    if (maybeDate == null) return null;
    return DateTime.parse(maybeDate).toLocal();
  }

  static UserModel? get user {
    final userJson = _storage.read(_userKey);
    if (userJson == null) return null;
    return UserModel.fromJson(userJson);
  }

  // Setters
  static void setToken(String? newToken) => _storage.write(_tokenKey, newToken);

  static void setExpiryDate(DateTime? newTokenExpiryDate) =>
      _storage.write(_tokenExpiryDateKey, newTokenExpiryDate?.toUtc().toString());

  static void setUser(UserModel? newUser) => _storage.write(_userKey, newUser?.toJson());
}
