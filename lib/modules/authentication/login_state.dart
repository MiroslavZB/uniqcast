import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/modules/authentication/auth_service.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

part 'login_state.g.dart';

@riverpod
class LoginState extends _$LoginState {
  @override
  Future<void> build() async {}

  Future<void> login({
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
      final expiryDate = data.expiryTime == null
          ? DateTime(2099, 12, 12)
          : DateTime.now().add(Duration(milliseconds: data.expiryTime!));

      StorageProvider.setToken(token);
      StorageProvider.setExpiryDate(expiryDate);
      ref.invalidate(routerProvider);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
    state = const AsyncValue.data(null);
  }

  void logout() {
    StorageProvider.setToken(null);
    StorageProvider.setExpiryDate(null);
    ref.invalidate(routerProvider);
  }
}