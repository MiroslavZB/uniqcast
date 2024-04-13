import 'package:flutter/material.dart';
import 'package:uniqcast/components/responsive_widgets/screen_size_check.dart';

double responsiveSize(
  BuildContext context, {
  required double largeSize,
  double? mediumSize,
  double? smallSize,
}) =>
    isLarge(context)
        ? largeSize
        : isMedium(context)
            ? (mediumSize ?? largeSize)
            : smallSize ?? largeSize;
