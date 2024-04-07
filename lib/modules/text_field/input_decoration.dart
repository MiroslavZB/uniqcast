import 'package:flutter/material.dart';
import 'package:uniqcast/resources/border_radius.dart';
import 'package:uniqcast/resources/text_style.dart';

InputDecoration textFieldDecoration({
  required ColorScheme t,
  BorderRadius? borderRadius,
  Color? focusColor,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    errorStyle: textSH6.copyWith(color: t.error),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: focusColor ?? t.primary),
      borderRadius: borderRadius ?? smallBorderRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: t.outline),
      borderRadius: borderRadius ?? smallBorderRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: t.primary, width: 2),
      borderRadius: borderRadius ?? smallBorderRadius,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: t.error, width: 1.5),
      borderRadius: borderRadius ?? smallBorderRadius,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: t.error, width: 2),
      borderRadius: borderRadius ?? smallBorderRadius,
    ),
  );
}
