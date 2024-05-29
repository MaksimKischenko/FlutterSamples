import 'package:di_examples_app/simple/models.dart';
import 'package:flutter/material.dart';

class ExampleWidget2 extends StatelessWidget {

  final ExampleAbstractViewModel model;

  const ExampleWidget2({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: model.onPressMe2,
            child: const Text('Click')
          ),
        )
      ),
    );
  }
}