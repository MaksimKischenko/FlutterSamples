
import 'package:di_examples_app/main.dart';
import 'package:di_examples_app/without_di/models.dart';
import 'package:flutter/material.dart';

class ServiceLocator {

  static final instance = ServiceLocator._(); //могу вызывать изнутри но никак снаружи. К нему можно обратиться лишь через переменную 
  ServiceLocator._(); //приватный конструктор


  SummatorSecond _makeSummatorSecond() => SummatorSecond();

  CalculatorServiceSecond _calculatorServiceSecond() => CalculatorServiceSecond(_makeSummatorSecond());

  ExampleRealViewModelDI _makeExampleViewModelDi() => ExampleRealViewModelDI(_calculatorServiceSecond());

  Widget makeApp() => MyApp(calculatorServiceSecond: _calculatorServiceSecond());

}
