import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uniqcast/components/expanded_button.dart';
import 'package:uniqcast/functions/percent_size.dart';
import 'package:uniqcast/modules/authentication/login_state.dart';
import 'package:uniqcast/modules/text_field/input_decoration.dart';
import 'package:uniqcast/modules/text_field/keyboard_visibility_listener.dart';
import 'package:uniqcast/modules/text_field/unfocus.dart';
import 'package:uniqcast/modules/text_field/unfocus_wrap.dart';
import 'package:uniqcast/modules/text_field/validators.dart';
import 'package:uniqcast/utils/assets.gen.dart';
import 'package:uniqcast/utils/extensions.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginStateProvider, (previous, next) {
      if (previous == next || !next.hasError || next.error is! DioException) return;
      context.showSnackBar(context, (next.error as DioException).serverErrorMessage);
    });

    final state = ref.watch(loginStateProvider);
    final notifier = ref.watch(loginStateProvider.notifier);

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final usernameController = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);

    final passwordIsObscure = useState(true);
    final logoIsVisible = useState(true);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: UnfocusWrap(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  KeyboardVisibilityListener(
                    listener: (isKeyboardVisible) => logoIsVisible.value = !isKeyboardVisible,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: logoIsVisible.value
                          ? SvgPicture.asset(
                              Assets.uniqcastLogo,
                              // ignore: deprecated_member_use
                              color: Theme.of(context).colorScheme.primaryContainer,
                              width: percentWidth(context, 50),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: firstNameController,
                      validator: (String? value) => nonEmptyField(value, 'First name'),
                      decoration: textFieldDecoration(t: Theme.of(context).colorScheme).copyWith(
                        hintText: 'First name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: lastNameController,
                      validator: (String? value) => nonEmptyField(value, 'Last name'),
                      decoration: textFieldDecoration(t: Theme.of(context).colorScheme).copyWith(
                        hintText: 'Last name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: usernameController,
                      validator: (String? value) => nonEmptyField(value, 'Username'),
                      decoration: textFieldDecoration(t: Theme.of(context).colorScheme).copyWith(
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (String? value) => nonEmptyField(value, 'Password'),
                      obscureText: passwordIsObscure.value,
                      decoration: textFieldDecoration(t: Theme.of(context).colorScheme).copyWith(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: passwordIsObscure.flip,
                          icon: Icon(
                            passwordIsObscure.value ? Icons.visibility_off : Icons.visibility,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ExpandedButton(
                    isLoading: state.isLoading,
                    onTap: () {
                      if (formKey.valid) {
                        notifier
                            .login(
                              username: usernameController.text,
                              password: passwordController.text,
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                            )
                            .whenComplete(unfocus);
                      }
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
