
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:routing_test/config/routes.gr.dart';



class MyApp extends StatelessWidget {

  final _appRouter = Routes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), 
      routerDelegate: AutoRouterDelegate(_appRouter), //_appRouter.delegate(), 
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}

