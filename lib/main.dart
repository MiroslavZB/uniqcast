import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/resources/theme.dart';
import 'package:uniqcast/routing/router_provider.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      theme: theme(lightColorScheme),
      darkTheme: theme(darkColorScheme),
      routerConfig: router,
    );
  }
}
