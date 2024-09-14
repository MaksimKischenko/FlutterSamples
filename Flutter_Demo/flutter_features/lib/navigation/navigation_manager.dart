
import 'package:flutter/material.dart';

import 'navigation_manager_setup.dart';


/// Manager used to handle navigation between the components.
class NavigationManager {
  /// Returns the arguments of the navigation
  static Object? get args => _args;
  static Object? _args = <String, dynamic>{};

  static String? _currentTabBarLocation;

  /// Returns the arg of type T. It works if the args are passed as a
  /// Map<String, dynamic>. If T is not the right type, null is returned
  static T? mapArg<T>(String name) => argsMap[name] is T ? argsMap[name] as T : null;

  static Map<String, dynamic> get argsMap =>
      args is Map<String, dynamic> ? args as Map<String, dynamic> : <String, dynamic>{};

  /// Returns the [ModalRoute] args of type [T] if available, otherwise the navigation manager args
  static T? routeArgs<T>(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is T) {
      return args;
    }

    return _args is T ? _args as T : null;
  }

  /// This holds the current status of BR6 design being enabled or not from
  /// experimental features. This value is typically set from the event bus
  static bool isBr6 = false;

  static List<String> get _bottomRoutes =>
      isBr6 ? NavigationManagerSetup.bottomBarRoutesBr6 : NavigationManagerSetup.bottomBarRoutes;

  /// Navigates to the [route] by either switching the tab or pushing a new route
  /// on to the navigation stack.
  /// [arguments] is the optional arguments passed to the new route. If this method call is
  /// go_router based, then the [arguments] will be supplied as 'queryParameters'.
  /// The arguments [pathParams] and [extra] are only available for go_router based navigation.
  /// [go] is only available for go_router which wraps the [GoRouter.goNamed] call. Passing false
  /// to [go] will force go_router to use [GoRouter.pushNamed] instead.
  /// [unFocusKeyboard] is used to dismiss the keyboard, if opened while navigating to next screen.
  /// [forcePush] is to push a new route on top of the bottom bar rather than switching the tab.
  /// [replace] is to replace the current route when pushing a new one.
  /// You can optionally pass the [context]. If passed, then this context will be used for push()
  /// and pop() operations. Otherwise, the global context of GoRouter context will be used.
  /// This could be useful for navigating screens that are outside of the scope of BottomBar like
  /// Splash screens.
  ///
  /// [removeUntil] A predicate function to determine which routes to remove from the stack during push.
  /// Will be ignored for GoRouter navigation and if [replace] is true.
  static Future<T?> pushNamed<T>(
    String route, {
    Object? arguments,
    Map<String, String>? pathParams,
    bool replace = false,
    bool forcePush = false,
    bool go = false,
    bool reset = false,
    bool unFocusKeyboard = false,
    Object? extra,
    BuildContext? buildContext,
    PageRouteBuilder<T>? customPageRouteBuilder,
    RoutePredicate? removeUntil,
  }) async {
    _args = arguments;
    if (unFocusKeyboard) {
      FocusManager.instance.primaryFocus?.unfocus();
    }

    if (reset) {
      NavigationManager.resetNavigation(resetBottomBar: false);
    }

    final context = buildContext ?? NavigationManagerSetup.rooNavigatorContext;

    if (_bottomRoutes.contains(route)) {
      // If the route is any component which is available in the tab bar,
      // Just switch the tab using go_router
      // if (!forcePush) {
      //   _currentTabBarLocation = route;
      //   NavigationManager.resetNavigation(resetBottomBar: false, context: context);
      //   GoRouter.of(context).goNamed(
      //     route,
      //     extra: extra,
      //     queryParameters: arguments as Map<String, dynamic>? ?? {},
      //     pathParameters: pathParams ?? {},
      //   );
      //   // Set the active route in the bottom bar to show the selected tab indicator
      //   DtcEventBus.instance.fireEvent(BottomBarEvent(route: route));
      // } else {
      //   return GoRouter.of(context).pushNamed(
      //     route,
      //     extra: extra,
      //     queryParameters: arguments as Map<String, dynamic>? ?? {},
      //     pathParameters: pathParams ?? {},
      //   );
      // }
    } else {
      if (NavigationManagerSetup.routes[route] != null) {
        // If the component uses nav 1
        PageRoute<T> pageRoute;
        if (customPageRouteBuilder != null) {
          pageRoute = PageRouteBuilder(
            pageBuilder: (_, __, ___) => NavigationManagerSetup.routes[route]!(context),
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) {
              return customPageRouteBuilder.buildTransitions(
                context,
                animation,
                secondaryAnimation,
                child,
              );
            },
            settings: RouteSettings(
              arguments: arguments,
              name: route,
            ),
          );
        } else {
          pageRoute = MaterialPageRoute<T>(
            builder: NavigationManagerSetup.routes[route]!,
            settings: RouteSettings(
              arguments: arguments,
              name: route,
            ),
          );
        }

        if (replace) {
          return Navigator.pushReplacement(context, pageRoute);
        } else if (removeUntil != null) {
          return Navigator.pushAndRemoveUntil(context, pageRoute, removeUntil);
        } else {
          return Navigator.push(context, pageRoute);
        }
      } else {
        if (go) {
          // GoRouter.of(context).goNamed(
          //   route,
          //   pathParameters: pathParams ?? {},
          //   queryParameters: arguments as Map<String, dynamic>? ?? {},
          //   extra: extra,
          // );
        } else {
          if (replace) {
            // return GoRouter.of(context).pushReplacementNamed(
            //   route,
            //   pathParameters: pathParams ?? {},
            //   queryParameters: arguments as Map<String, dynamic>? ?? {},
            //   extra: extra,
            // );
          } else {
            // return GoRouter.of(context).pushNamed(
            //   route,
            //   pathParameters: pathParams ?? {},
            //   queryParameters: arguments as Map<String, dynamic>? ?? {},
            //   extra: extra,
            // );
          }
        }
      }
    }
    return null;
  }

  /// This is only available for go_router components.
  /// This Wraps [GoRouter.push]
  static void goRouterPush(
    BuildContext context,
    String name, {
    Object? extra,
    bool unfocusKeyboard = true,
  }) {
    if (unfocusKeyboard) {
      FocusManager.instance.primaryFocus?.unfocus();
    }

    // context.push(
    //   '${GoRouterState.of(context).uri.path}/$name',
    //   extra: extra,
    // );
  }

  /// Can pop the current route
  // static bool canPop(BuildContext context) {
  //   return GoRouter.of(context).canPop();
  // }

  /// Pops the current route
  // static void pop<T>(BuildContext context, {T? result}) {
  //   if (canPop(context)) {
  //     GoRouter.of(context).pop(result);
  //   }
  // }

  /// Returns the current route
  // static String currentGoRoute() {
  //   final goRouterState = GoRouterState.of(NavigationManagerSetup.globalContext);
  //   final location = '/${Uri.parse(goRouterState.uri.toString()).pathSegments.first}';
  //   return location;
  // }

  /// Pops the navigation until the [route] is found
  static void popUntil(BuildContext context, {required String route, bool inclusive = false}) {
    Navigator.of(context).popUntil(
      popUntilPredicate(routeName: route, inclusive: inclusive),
    );
  }

  /// Creates a [RoutePredicate] that can be used with Navigator's `popUntil` method.
  ///
  /// The predicate returns `true` based on the following conditions:
  /// - If [safe] is `true` and the route is the first route, the predicate returns `true`.
  /// - If [inclusive] is `true`, the predicate returns `true` after the target route ([routeName]) is found and popped.
  /// - If [inclusive] is `false`, the predicate returns `true` only when the target route ([routeName]) is found.
  static RoutePredicate popUntilPredicate({
    required String routeName,
    bool inclusive = false,
    bool safe = true,
  }) {
    var wasTargetPopped = false;
    return (route) {
      if (safe && route.isFirst) return true;

      final isTarget = route.settings.name == routeName;
      if (inclusive) {
        if (wasTargetPopped) return true;
        if (isTarget) {
          wasTargetPopped = true;
        }
        return false;
      } else {
        return isTarget;
      }
    };
  }

  /// Pops the navigation until the [targetRouteName] is found OR until it hits the first route
  static void safePopUntil(BuildContext context, {required String targetRouteName}) {
    Navigator.of(context).popUntil((route) {
      if (route.isFirst) {
        return true;
      }
      return route.settings.name == targetRouteName;
    });
  }

  /// Resets the navigation to the initial route
  /// For Boss Money app prefer using [resetBottomBar] == `false` since when set to`true` it
  /// recreates the Home Page
  static void resetNavigation({bool resetBottomBar = true, BuildContext? context}) {
    // Reset the navigation to the bottom bar level.
    // This is a work around for resetting the routes If the component is based on GoRouter.
    // Replace the logic once GoRouter officially supports imperative APIs like popUntil()
    // https://github.com/flutter/flutter/issues/99112#issuecomment-1583077752
    Navigator.of(context ?? NavigationManagerSetup.globalContext).popUntil(
      (route) => route.isFirst,
    );

    // if (resetBottomBar) {
    //   pushNamed(currentGoRoute(), go: true);
    // }
  }

  /// Controls the visibility of the native bottom bar with [visible]
  // static void flutterBottomBarVisibility(bool visible) {
  //   DtcEventBus.instance.fireEvent(BottomBarVisibilityEvent(visible: visible));
  // }

  /// Returns the current route of the navigation at [context]
  /// static String _currentRoute(BuildContext context) => ModalRoute.of(context)?.settings.name ?? '';

  ///Open Url in a webView
  // static void openWebViewUrl(
  //   BuildContext context, {
  //   required String url,
  //   required String title,
  // }) {
  //   if (context.mounted) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute<void>(
  //         builder: (context) => WebViewPage(
  //           initialUrl: url,
  //           title: title,
  //         ),
  //       ),
  //     );
  //   }
  // }

  static void switchTabBar() {
    pushNamed(
      _currentTabBarLocation ?? _bottomRoutes[0],
      go: true,
    );
  }
}
