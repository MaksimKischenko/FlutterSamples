// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/first_route.dart' as _i1;
import '../screens/second_route.dart' as _i2;

class Routes extends _i3.RootStackRouter {
  Routes([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FirstPage.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.FirstRoute());
    },
    SecondPage.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SecondRoute());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(FirstPage.name, path: '/'),
        _i3.RouteConfig(SecondPage.name, path: '/second-route')
      ];
}

/// generated route for
/// [_i1.FirstRoute]
class FirstPage extends _i3.PageRouteInfo<void> {
  const FirstPage() : super(FirstPage.name, path: '/');

  static const String name = 'FirstPage';
}

/// generated route for
/// [_i2.SecondRoute]
class SecondPage extends _i3.PageRouteInfo<void> {
  const SecondPage() : super(SecondPage.name, path: '/second-route');

  static const String name = 'SecondPage';
}
