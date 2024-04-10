import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/modules/authentication/login_page.dart';
import 'package:uniqcast/modules/user/user_state.dart';
import 'package:uniqcast/root.dart';
import 'package:uniqcast/routing/app_route.dart';
import 'package:uniqcast/utils/extensions.dart';
import 'package:uniqcast/utils/providers/storage_provider.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoute.login.path,
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final bool isAuthenticated = StorageProvider.token.safeNotEmpty;
      final bool isAuthPage = [AppRoute.login, AppRoute.register].any((e) => e.path == state.fullPath);

      if (!isAuthenticated && !isAuthPage) return AppRoute.login.path;

      if (isAuthenticated && isAuthPage) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          ref.watch(userStateProvider.notifier).set(StorageProvider.user);
        });
        return AppRoute.root.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.root.path,
        name: AppRoute.root.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const Root(),
        ),
      ),
      GoRoute(
        path: AppRoute.login.path,
        name: AppRoute.login.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
    ],
  );
});
