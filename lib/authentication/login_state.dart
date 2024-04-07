import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/authentication/auth_service.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

part 'login_state.g.dart';

@riverpod
class LoginState extends _$LoginState {
  @override
  Future<void> build() async {}

  Future<void> tryLogin({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      state = const AsyncValue.loading();

      final data = await AuthService.login(
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      final token = data.token;

      StorageProvider.setToken(token);
      state = const AsyncValue.data(null);
      ref.invalidate(routerProvider);
    } catch (e, s) {
      log('try login error $s $s');
      state = AsyncValue.error(e, s);
    }
  }

  void logout() {
    StorageProvider.setToken(null);
    ref.invalidate(routerProvider);
  }
}
