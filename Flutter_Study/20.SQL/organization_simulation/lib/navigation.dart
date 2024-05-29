import 'package:flutter/material.dart';

mixin Navigation {

  static GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void toSplash() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/',
    (route) => false
  );

  static void toAuth() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/auth',
    (route) => false
  );
  
  static void toManager() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/manager',
    (route) => false
  );

  static void toEmployee() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/employee',
    (route) => false
  );

  static void toFreaLancer() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/frealancer',
    (route) => false
  );

  static void toManagerAdd() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/manager/add',
    (route) => false
  );

  static void toEmployeeAdd() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/employee/add',
    (route) => false
  );

   static void toFrealamcerAdd() => navigatorKey.currentState?.pushNamedAndRemoveUntil(
    '/frealancer/add',
    (route) => false
  );

  
}