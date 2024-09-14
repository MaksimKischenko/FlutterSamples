import 'package:flutter/material.dart';

class NavigationObserver extends RouteObserver<PageRoute<dynamic>> {
  /// Current route of the navigation stack
  static String get currentRoute => _currentRoute;
  static String _currentRoute = '';

  /// Root route of the current the navigation stack.
  /// Consider that if there is a bottom bar, each tab has its own navigation stack,
  /// so the route coincides with the current active bottom bar's route
  static String get rootRoute => _rootRoute;
  static String _rootRoute = '';

  /// Set of routes visited since the app start, used for analytics.
  static Set<String> get rootRoutesVisited => _rootVisited;
  static final Set<String> _rootVisited = {};

  /// Returns true if the [route] was the first one visited at app start, false if the user landed
  /// on it from another tab
  static bool isFirstVisited(String route) =>
      _rootVisited.length == 1 && _rootVisited.first == route;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _currentRoute = route.settings.name ?? '';
    if (route.isFirst) {
      _rootRoute = _currentRoute;
      if (_rootRoute.isNotEmpty) {
        _rootVisited.add(_rootRoute);
      }
    }
    _log('didPush', route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _currentRoute = newRoute?.settings.name ?? '';
    _log('didReplace', newRoute, oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _currentRoute = previousRoute?.settings.name ?? '';
    _log('didPop', route, previousRoute);
  }

  void _log(String method, Route<dynamic>? route, Route<dynamic>? previousRoute) {
    // Log.d(
    //   '$method => Route: ${route?.settings.name}, Previous Route: ${previousRoute?.settings.name}',
    // );
  }
}
