import 'package:flutter/material.dart';

import 'model/models.dart';
import 'model/widget_generated_adapter_model.dart';
import 'model/widget_listanable_model.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({ Key? key }) : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {

  final model = ExampleListanableModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: model.setUp, 
                child: const Text('CLICK SETUP')
              ),
              ElevatedButton(
                onPressed: model.doSome, 
                child: const Text('CLICK ADD')
              ),
            ],
          ),
        )
      ),
    );
  }
}