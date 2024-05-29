import 'package:flutter/material.dart';

import 'navigation.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final path = settings.name;

        Widget Function(BuildContext)? builder;

        if(path == '/') {
          builder = (context) => const Page1();
        } else if(path == '/2') {
          builder = (context) => const Page2();
        } else if(path == '/3') {
          builder = (context) => const Page3();
        }
        return MaterialPageRoute(
          settings: settings,
          builder: builder!
        );
      },
      navigatorKey: Navigation.navigatorKey,
    );
  }
}

