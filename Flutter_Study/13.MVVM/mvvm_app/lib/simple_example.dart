import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';




class ViewModel extends ChangeNotifier {
  var _age = 0;
  int get age => _age;

  void loadValue() async {
    final sharedPreferences =  await SharedPreferences.getInstance();
    _age = sharedPreferences.getInt('age') ?? 0;
    notifyListeners();
  }

  ViewModel() {
    loadValue();
  }

  void incrementAge() async {
    _age+=1;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('age', _age);
    notifyListeners();
  }
  void decrementtAge() async {
    _age = max(_age -1, 0);
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('age', _age);
    notifyListeners();
  }
}

class SimpleExampleWidget extends StatelessWidget {
  const SimpleExampleWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final viewModel = context.watch<ViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
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
    final age = context.select((ViewModel vm) => vm._age);
    return Text('$age');
  }
}

class AgeIncrement extends StatelessWidget {
  const AgeIncrement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>(); //не нужно следить а необходимо лишь ее наличие 
    return ElevatedButton(
      onPressed: viewModel.incrementAge,
      child: const Text('+'),
    );
  }
}

class AgeDecrement extends StatelessWidget {
  const AgeDecrement({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>(); //не нужно следить а необходимо лишь ее наличие 
    return ElevatedButton(
      onPressed: viewModel.decrementtAge,
      child: const Text('-'),
    );
  }
}

