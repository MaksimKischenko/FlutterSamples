import 'package:di_examples_app/main.dart';
import 'package:di_examples_app/main_navigation.dart';
import 'package:di_examples_app/simple/models.dart';
import 'package:di_examples_app/without_di/models.dart';
import 'package:flutter/material.dart';

class DiContainer {

  SummatorSecond _makeSummatorSecond() => SummatorSecond();

  CalculatorServiceSecond _calculatorServiceSecond() => CalculatorServiceSecond(_makeSummatorSecond());

  //ExampleRealViewModelDI _makeExampleViewModelDi() => ExampleRealViewModelDI(_calculatorServiceSecond());

  // Widget makeApp() => MyApp(calculatorServiceSecond: _calculatorServiceSecond());


  // DiContainer() {
  //   var _mainNavigation = MainNavigation(screenFactory)
  // }
  
  // var app = MyApp(calculatorServiceSecond: calculatorServiceSecond);
}
