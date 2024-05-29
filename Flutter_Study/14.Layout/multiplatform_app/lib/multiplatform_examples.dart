import 'package:flutter/material.dart';
import 'package:multiplatform_app/multiplatform.dart';

class MultiplatformExamples extends StatefulWidget {
  const MultiplatformExamples({Key? key}) : super(key: key);

  @override
  State<MultiplatformExamples> createState() => _MultiplatformExamplesState();
}

class _MultiplatformExamplesState extends State<MultiplatformExamples> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Multiplatform.showdatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now());
          }, 
          child: const Text('PUSH')
        )
      ),
    );
  }
}