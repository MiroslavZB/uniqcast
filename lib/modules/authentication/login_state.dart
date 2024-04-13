import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uniqcast/api/client.dart';
import 'package:uniqcast/modules/authentication/auth_service.dart';
import 'package:uniqcast/modules/user/user_state.dart';
import 'package:uniqcast/routing/router_provider.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

part 'login_state.g.dart';

@riverpod
class LoginState extends _$LoginState {
  late AuthService authService;
  @override
  Future<void> build() async {
    authService = AuthService(ref.watch(clientProvider));
  }

  Future<void> login({
    required String username,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      state = const AsyncValue.loading();

      final user = await authService.login(
        username: username,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );

      final expiryTime = int.tryParse(user.expiryTime ?? '');

      final expiryDate = user.expiryTime == null
          ? DateTime(2099, 12, 12)
          : expiryTime == null
              ? null
              : DateTime.now().add(Duration(milliseconds: expiryTime));

      StorageProvider.setUser(user);
      StorageProvider.setToken(user.token);
      StorageProvider.setExpiryDate(expiryDate);

      ref.watch(userStateProvider.notifier).set(user);
      ref.invalidate(routerProvider);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
    state = const AsyncValue.data(null);
  }

  void logout() {
    StorageProvider.logOut();
    ref.invalidate(routerProvider);
  }
}
