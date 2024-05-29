
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model {
  var age = 0;

  Model({
    required this.age,
  });
  
}

class SimpleExampleWidget2 extends StatefulWidget {
  const SimpleExampleWidget2({Key? key}) : super(key: key);


  @override
  State<SimpleExampleWidget2> createState() => _SimpleExampleWidgetState2();
}

class _SimpleExampleWidgetState2 extends State<SimpleExampleWidget2> {

  var model = Model(age: 0);

  void incrementAge() {
    model = Model(age: model.age + 1); //можем написать  model.copyWith(age:model.age + 1);
    setState(() {
      
    });
  }

  void decrementAge() {
    model = Model(age: model.age - 1);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: this,
      child: Provider.value(
        value: model,
        child: const View()
      )
    );
  }
}

class View extends StatelessWidget {
  const View({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<_SimpleExampleWidgetState2>();
    final value = context.watch<Model>();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${value.age}'),
          ElevatedButton(
            onPressed: state.incrementAge,
            child: const Text('+'),
          ),
          ElevatedButton(
            onPressed: state.decrementAge,
            child: const Text('-'),
          )                    
        ],
      ),
    );
  }
}