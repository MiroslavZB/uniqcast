import 'package:flutter/material.dart';
import 'package:uniqcast/resources/border_radius.dart';
import 'package:uniqcast/resources/icon_size.dart';
import 'package:uniqcast/resources/text_style.dart';
import 'package:uniqcast/utils/extensions.dart';

class ExpandedButton extends StatelessWidget {
  final void Function()? onTap;
  final bool isLoading;
  final String? text;
  final TextStyle? textStyle;
  final Color? color_;
  final Color? onColor_;
  final Widget? trailingWidget;
  final Widget? leadingWidget;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double iconSize;
  final Border? border;
  final MainAxisAlignment? mainAxisAlignment;

  const ExpandedButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    this.text,
    this.textStyle,
    this.color_,
    this.onColor_,
    this.trailingWidget,
    this.leadingWidget,
    this.leadingIcon,
    this.trailingIcon,
    double? iconSize,
    this.border,
    this.mainAxisAlignment,
  }) : iconSize = iconSize ?? smallIconSize;

  @override
  Widget build(BuildContext context) {
    final Color color = color_ ?? Theme.of(context).colorScheme.primary;
    final Color onColor = onColor_ ?? Theme.of(context).colorScheme.onPrimary;
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
          color: color,
          border: border,
          borderRadius: extraSmallBorderRadius,
        ),
        child: isLoading
            ? Center(
              child: SizedBox(
                  height: 26,
                  width: 26,
                  child: CircularProgressIndicator(color: onColor),
                ),
            )
            : Row(
                mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                children: [
                  if (leadingWidget != null) SizedBox(height: iconSize, width: iconSize, child: leadingWidget),
                  if (leadingIcon != null) Icon(leadingIcon, color: onColor, size: iconSize),
                  if (text != null) Text(text!, style: textStyle ?? textSH4.copyWith(color: onColor)),
                  if (trailingIcon != null) Icon(trailingIcon, color: onColor, size: iconSize),
                  if (trailingWidget != null) SizedBox(height: iconSize, width: iconSize, child: trailingWidget),
                ].expand((widget) => [widget, const SizedBox(width: 10)]).toList()
                  ..removeLast(),
              ),
      ),
    );
  }
}
