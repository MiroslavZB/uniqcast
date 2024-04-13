import 'package:flutter/material.dart';
import 'package:uniqcast/resources/border_radius.dart';
import 'package:uniqcast/resources/text_style.dart';
import 'package:uniqcast/utils/extensions.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isLoading;
  const LoginButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).colorScheme;
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: ButtonStyle(
        elevation: (12.0).toMaterialStateProperty,
        padding: (EdgeInsets.zero).toMaterialStateProperty,
        shape: RoundedRectangleBorder(borderRadius: extraSmallBorderRadius).toMaterialStateProperty,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: t.primary,
          borderRadius: extraSmallBorderRadius,
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(color: t.onPrimary),
                )
              : Text(
                  'Login',
                  style: textSH4.copyWith(color: t.onPrimary),
                ),
        ),
      ),
    );
  }
}
