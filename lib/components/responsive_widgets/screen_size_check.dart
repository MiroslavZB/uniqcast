import 'package:flutter/material.dart';
import 'package:uniqcast/functions/percent_size.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 378;

bool isLarge(BuildContext context) => percentWidth(context) >= largeScreenSize;
bool isMedium(BuildContext context) =>
    percentWidth(context) > mediumScreenSize && percentWidth(context) < largeScreenSize;
bool isSmall(BuildContext context) => percentWidth(context) < smallScreenSize;
