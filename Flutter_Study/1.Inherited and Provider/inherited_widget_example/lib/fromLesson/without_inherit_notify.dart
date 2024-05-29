
import 'package:flutter/material.dart';

class ExampleWithoutNotify extends StatelessWidget {
  const ExampleWithoutNotify({ Key? key }) : super(key: key);

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


//Виджет как хранилище. Он просто внедряет модель в дерево. Но ничего не перерисовывает и setState не вызываем ниразу
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

//Обычный класс на который можно подписаться чтобы хранить внутри какие то данные 
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
    notifyListeners(); //чтобы все подписчики получили уведомления 
 }
}


class SimpleCalcWidgetProvider extends InheritedWidget {

  final SimpleCalcWidgetModel model;

  const SimpleCalcWidgetProvider({
    Key? key,
    required Widget widget,
    required this.model
  }) :super(key: key, child: widget);

  static SimpleCalcWidgetProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  }

  //Т.к мы не меняли саму модель а меняли лишь ее данные, то изначально никаких изменений мы не увидим!
  // хоть у нас действительно считается сумма (для самого инхерита ничего не поменялось, а значит и уведомлять никого не нужно!!!!)
  @override
  bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
    return model != oldWidget.model;
  }
}


class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => SimpleCalcWidgetProvider.of(context)?.model.firstNumber = value
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) => SimpleCalcWidgetProvider.of(context)?.model.secondNumber = value
    );
  }
}

class SumButtonWidget extends StatelessWidget {
  const SumButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.of(context)?.model.summ(),
      child: const Text('Count summ'),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({ Key? key }) : super(key: key);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  String _value = '-1';

  //будет вызываться только тогда когда поменяетс МОДЕЛЬ! 
  //чтобы не добавлять addL на каждый вызов билда а 1 раз на 1 модель 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = SimpleCalcWidgetProvider.of(context)?.model;

    //таким образом можем слушать изменения 
    model?.addListener(() {
        _value = '${model.sumResult}';
        setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('Result: $_value');
  }
}

