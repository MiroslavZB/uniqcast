import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/authentication/user_model.dart';

class AuthService {
  final Client client;

  AuthService(this.client);

  Future<UserModel> login({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async =>
      client.post<UserModel>(
        '/v1/global/login',
        body: {
          'login_type': 'Credentials',
          'username': username,
          'password': password,
          'device': 'flutter_test_device_${firstName}_$lastName'
        },
      );
}
