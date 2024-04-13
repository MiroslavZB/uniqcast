import 'package:flutter/material.dart';

double percentWidth(BuildContext context, [int x = 100]) {
  if (x <= 0) return 0;
  final double width = MediaQuery.of(context).size.width;
  if (x >= 100) return width;
  return x * width * 0.01;
}

double percentHeight(BuildContext context, [int x = 100]) {
  if (x <= 0) return 0;
  final double height = MediaQuery.of(context).size.height;
  if (x >= 100) return height;
  return x * height * 0.01;
}
