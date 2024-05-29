import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const example = '/';
}

abstract class ScreenFactory {
  Widget makeExampleScreen();
}

class MainNavigation {

  final ScreenFactory screenFactory;

  MainNavigation(this.screenFactory);

  Map<String, Widget Function(BuildContext)> makeRoutes() =>
  
  //Мапа
    <String, Widget Function(BuildContext)>{
      MainNavigationRouteNames.example: (_) => screenFactory.makeExampleScreen()
    };

  Route<Object> onGenerateRoute(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      default:
      const widget = Text('Navigation error!');
      return MaterialPageRoute(builder: (_)=> widget);
    }
  }
}
