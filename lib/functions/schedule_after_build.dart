import 'package:flutter/scheduler.dart';

void scheduleAfterBuild(void Function() function) =>
    SchedulerBinding.instance.addPostFrameCallback((_) => function.call());
