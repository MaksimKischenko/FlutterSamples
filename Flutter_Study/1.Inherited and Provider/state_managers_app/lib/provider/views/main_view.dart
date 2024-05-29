import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managers_app/provider/view_models/age_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('AppProvider'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AgeTitle(),
              AgeIncrement(),
              AgeDecrement()
            ],
          ),
        ),
      ),
    );
  }
}


class AgeTitle extends StatelessWidget {
  const AgeTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final age = context.select((AgeViewModel vm) => vm.age);
    return Text('$age');
  }
}

class AgeIncrement extends StatelessWidget {
  const AgeIncrement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('+'); 
    return ElevatedButton(
      onPressed: context.read<AgeViewModel>().incrementAge, //не нужно следить а необходимо лишь ее наличие 
      child: const Text('+'),
    );
  }
}

class AgeDecrement extends StatelessWidget {
  const AgeDecrement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return ElevatedButton(
      onPressed: context.read<AgeViewModel>().decrementtAge,
      child: const Text('-'),
    );
  }
}

