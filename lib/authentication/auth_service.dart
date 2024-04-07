import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/authentication/login_response.dart';

abstract class AuthService {
  static Future<LoginResponse> login({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async =>
      Client.post<LoginResponse>(
        '/global/login',
        body: {
          'login_type': 'Credentials',
          'username': username, // 'flutter_test',
          'password': password, // '1111',
          'device': 'flutter_test_device_${firstName}_$lastName'
        },
      );
}
