
import 'package:di_examples_app/main_navigation.dart';
import 'package:di_examples_app/service_locator/service_locator.dart';
import 'package:di_examples_app/with_di/di_container.dart';
import 'package:di_examples_app/without_di/models.dart';
import 'package:flutter/material.dart';



final diContainer = DiContainer();

void main() {

  //все обьекты должны быть проинициавлизированы и созданы!!!
  // var calculatorSecond = SummatorSecond();
  // var calculatorServiceSecond = CalculatorServiceSecond(calculatorSecond);
  // var app = MyApp(calculatorServiceSecond: calculatorServiceSecond);
  // runApp(app);


  //работа с DI контейнером
  //final app = diContainer.makeApp();

  final app = ServiceLocator.instance.makeApp();
}

class MyApp extends StatelessWidget {

  final CalculatorServiceSecond calculatorServiceSecond;
  final MainNavigation? mainNavigation;

  const MyApp({Key? key, this.mainNavigation, required this.calculatorServiceSecond}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: mainNavigation!.makeRoutes(),
      onGenerateRoute: mainNavigation?.onGenerateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: ExampleWidget1(
      //   mode: ExampleWidgetMode.calc,
      // )
      //  home: ExampleWidget2(
      //   model: ExampleRealViewModel(),
      // )
      // home: ExampleWidget3(
      //   model: ExampleRealViewModelDI(calculatorServiceSecond)
      // )
    );
  }
}