
import 'package:di_examples_app/simple/models.dart';
import 'package:di_examples_app/without_di/models.dart';
import 'package:flutter/material.dart';

class ExampleWidget3 extends StatelessWidget {

  final ExampleRealViewModelDI model;

  const ExampleWidget3({Key? key, required this.model}) : super(key: key);

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