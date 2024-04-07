import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/authentication/login_state.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final notifier = ref.watch(loginStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await notifier.tryLogin(
              username: 'flutter_test',
              password: '1111',
              firstName: 'some',
              lastName: 'test',
            );
          },
          child: const Text('press me'),
        ),
      ),
    );
  }
}
