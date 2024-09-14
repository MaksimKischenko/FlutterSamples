
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_features/navigation/navigation_observer.dart';


class NavigationManagerSetup {
  /// Key used to identify the main [Scaffold].
  static final GlobalKey<ScaffoldState> stackLevelKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey<ScaffoldState>();

  /// context that we can get from initial context scope if
  /// [globalScaffoldKey.currentContext] is null.
  static BuildContext? outerContext;

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  /// [BuildContext] of the [ComponentsStack]'s scaffold
  static BuildContext get globalContext {
    final context = globalScaffoldKey.currentContext ?? outerContext;
    if (context == null) {
      throw Exception(
        'The [globalScaffoldKey] is not attached to the main Scaffold',
      );
    }
    return context;
  }

  /// [BuildContext] of the GoRouter Root navigator key
  static BuildContext get rooNavigatorContext {
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      throw Exception(
        'The goRouter is not setup. Pass the context of your current widget tree.',
      );
    }
    return context;
  }

  /// [BuildContext] of the GoRouter Shell navigator key
  static BuildContext get shellNavigatorContext {
    final context = shellNavigatorKey.currentContext;
    if (context == null) {
      throw Exception(
        'The goRouter is not setup. Pass the context of your current widget tree.',
      );
    }
    return context;
  }

  /// Key used to identify the boss_web nested [Navigator] (area without appbar and left menu)
  static final GlobalKey<NavigatorState> webNavigatorKey = GlobalKey<NavigatorState>();

  /// [BuildContext] of the the boss_web's nested [Navigator]
  static BuildContext? get webContext {
    return webNavigatorKey.currentContext;
  }

  /// Map of routes (key) available in the app with their [WidgetBuilder] (value)
  static Map<String, WidgetBuilder> get routes =>
      UnmodifiableMapView<String, WidgetBuilder>(_routes);
  static final Map<String, WidgetBuilder> _routes = {};

  /// The [GoRouter] based base routes, if the package uses go_router for navigation
  // static List<RouteBase> get goRouterRoutes => _goRouterRoutes;
  // static final List<RouteBase> _goRouterRoutes = [];

  /// Routes that belongs to the bottom navigation bar
  static List<String> get bottomBarRoutes => _bottomBarRoutes;
  static List<String> _bottomBarRoutes = [];

  /// These are the experimental bottom bar items used for the new BR6 design.
  /// Users will be able to swap old and new items from settings during the transition period
  /// for testing purposes.
  static List<String> get bottomBarRoutesBr6 => _bottomBarRoutesBr6;
  static List<String> _bottomBarRoutesBr6 = [];

  /// Returns the initial route of the app to allow the components navigation
  static String _initialRoute = '';

  static String get initialRoute => _initialRoute;

  /// This will be used to enable or disable the device back button in the app, default is true
  static final ValueNotifier<bool> rootBackButtonEnabled = ValueNotifier(true);

  /// Observers of the navigation
  static List<NavigatorObserver> get routeObservers => _routeObservers;
  static final List<NavigatorObserver> _routeObservers = [
    NavigationObserver(),
    // AnalyticsRouteObserver(),
  ];

  /// Get the page at [route] calling its [WidgetBuilder]
  static Widget pageAt(String route) =>
      NavigationManagerSetup.routes[route]?.call(NavigationManagerSetup.globalContext) ??
      const SizedBox.shrink();

  /// Adds a new route observer for the app
  static void addRouteObserver({required NavigatorObserver observer}) {
    _routeObservers.add(observer);
  }

  /// Adds [routes] to the manager
  static void addRoutes(
    Map<String, WidgetBuilder> routes,
  ) {
    _routes.addAll(routes);
  }

  /// Setups the [NavigationManager].
  /// The [initialRoute] is mandatory and it will be passed to the main MaterialApp.
  /// The [bottomBarRoutes] are necessary to perform a switch tab navigation when
  /// a routes belongs to the bottom bar
  static void init({
    required String initialRoute,
    List<String> bottomBarRoutes = const [],
    List<String> bottomBarRoutesBr6 = const [],
  }) {
    // set the initial route only if available
    // (an empty string will trigger the notifier)
    _initialRoute = initialRoute;
    _bottomBarRoutes = bottomBarRoutes;
    _bottomBarRoutesBr6 = bottomBarRoutesBr6;
  }

  // static void addGoRouterRoutes(List<RouteBase> goRouterRoutes) {
  //   _goRouterRoutes.addAll(goRouterRoutes);
  // }
}
