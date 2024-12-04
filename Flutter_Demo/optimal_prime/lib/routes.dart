import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/screens/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
        child: const SplashScreen(),
      ),
    ),
    // GoRoute(
    //   path: '/home',
    //   pageBuilder: (context, state) => CustomTransitionPage<void>(
    //     key: state.pageKey,
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //         FadeTransition(opacity: animation, child: child),
    //     child: const HomeScreen(),
    //   ),
    // ),
  ],
);

class GoRouterObserver extends NavigatorObserver {
  // @override
  // void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   print('MyTest didPush: $route');
  // }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   print('MyTest didPop: $route');
  // }

  // @override
  // void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   print('MyTest didRemove: $route');
  // }

  // @override
  // void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
  //   print('MyTest didReplace: $newRoute');
  // }
}
