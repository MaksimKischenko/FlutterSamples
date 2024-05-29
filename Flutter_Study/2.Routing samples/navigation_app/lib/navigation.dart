import 'package:flutter/material.dart';

mixin Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void toPage1() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/',
    (route) => false
  );
  static void toPage2() => navigatorKey.currentState?.pushNamedAndRemoveUntil('/2',(route) => false);

  static void toPage3() => navigatorKey.currentState?.pushNamed(
    '/3',
  );
}