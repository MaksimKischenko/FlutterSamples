import 'package:di_examples_app/simple/models.dart';
import 'package:flutter/material.dart';



enum ExampleWidgetMode {calc, calc2}

class ExampleWidget1 extends StatelessWidget {

  final ExampleWidgetMode mode;
  final calcModel = ExampleViewModel();
  final calcModel2 = ExampleViewModel2();

  ExampleWidget1({Key? key, required this.mode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: mode == ExampleWidgetMode.calc? calcModel.onPresseMe : calcModel2.onPresseMe,
            child: const Text('Click')
          ),
        )
      ),
    );
  }
}