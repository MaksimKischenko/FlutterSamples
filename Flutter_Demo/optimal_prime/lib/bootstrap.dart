import 'dart:async';

import 'package:flutter/material.dart';
import 'package:optimal_prime/app.dart';
import 'package:optimal_prime/app_wrapper.dart';
import 'package:optimal_prime/utils/logger/log.dart';

import 'app_injector.dart';

Future<void> bootstrap() async {
  Log.setup();
  await AppInjector.run();
  runApp(const AppWrapper(child: App()));
}
