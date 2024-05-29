
import 'package:flutter/material.dart';

class ExampleWithNotify extends StatelessWidget {
  const ExampleWithNotify({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: SimpleCalcWidget() ,
        )
      ),
    );
  }
}


//Виджет как хранилище. Он просто внедряет модель в дерево
class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({ Key? key }) : super(key: key);

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {


  final _model = SimpleCalcWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCalcWidgetProvider(
          widget: const Column(
            mainAxisSize: MainAxisSize.min,
            children:  [
              FirstNumberWidget(),
              SizedBox(height: 10),
              SecondNumberWidget(),
              SizedBox(height: 10),
              SumButtonWidget(),
              SizedBox(height: 10),
              ResultWidget()
            ],
          ),
          model: _model,
        ),
      ),
    );
  }
}

//Обычный класс на который можно подписаться 
class SimpleCalcWidgetModel extends ChangeNotifier {

 int? _firstNumber; 
 int? _secondNumber; 
 int? sumResult; 

 set firstNumber(String value) => _firstNumber = int.tryParse(value);
 set secondNumber(String value) => _secondNumber = int.tryParse(value);

 void summ() {
   if(_firstNumber !=null && _secondNumber !=null) {
     sumResult = _firstNumber! + _secondNumber!;
   } else {
     sumResult = -1;
   }
    notifyListeners();
 }
}

//Берем значение которое должно имплеминтировать слушателя и вызывает обновление
//дочек если вызвался notifyL!
class SimpleCalcWidgetProvider extends InheritedNotifier<SimpleCalcWidgetModel> {

  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider({
    Key? key,
    required Widget widget,
    required this.model
  }) :super(key: key, notifier: model, child: widget);

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.notifier;
  }

  //Более адекватный пример для того чтобы не было дополнительных обновлений build()
  static SimpleCalcWidgetModel? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }
}


class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => SimpleCalcWidgetProvider.read(context)?.firstNumber = value
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => SimpleCalcWidgetProvider.read(context)?.secondNumber = value
    );
  }
}

class SumButtonWidget extends StatelessWidget {
  const SumButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.read(context)?.summ(),
      child: const Text('Count summ'),
    );
  }
}

class ResultWidget extends StatelessWidget {
  const ResultWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //watch чтобы следил за обновлениями и обновлялся 
    final value = SimpleCalcWidgetProvider.watch(context)?.sumResult;
    return Text('Result: $value');
  }
}