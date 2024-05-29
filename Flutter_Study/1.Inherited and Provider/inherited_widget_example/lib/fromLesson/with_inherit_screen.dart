import 'package:flutter/material.dart';

class WithInheritExample extends StatelessWidget {
  const WithInheritExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: DataOwnerStatefull()
        ),
      ),
    );
  }
}


//Виджеты без CONST обновляются при каждом изменении верхушки дерева!!!! Но если вдруг там нужные изменения то нужно добавить Inherit!

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({ Key? key }) : super(key: key);

  @override
  _DataOwnerStatefullState createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatefull> {

  var _value = 0;

  void _incriment() {
    _value +=1;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _incriment, 
          child: const Text('+')
        ),
        DataProviderInherited( //создается каждый раз новый 
          value: _value,
          child: const DataConsumerStateless()
        )
      ],
    );
  }
}


class DataProviderInherited extends InheritedWidget {

  final int value;

  const DataProviderInherited({
      Key? key, 
      required this.value,
      required Widget child
    }) : super(key: key, child: child);

  //обновились ли данные в классе
  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return value != oldWidget.value; //два инхерита с одинаковыми value это одинаковые инхериты. А два с разными уже разные 
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // хочу знать и обновлять данные подписавшись!
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>()?.value ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$value'),
        DataConsumerStatefull()
        
      ],
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
   DataConsumerStatefull({ Key? key }) : super(key: key);

  @override
  _DataConsumerStatefullState createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {

    //хочу знать но не обновлять данные (если стоит CONST)  ! Но стоит его только убрать и снова метод build() начнет отрабатывать 

    // final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // final dataProvider = element?.widget as DataProviderInherited;
    // final value = dataProvider.value;

    //ИЛИ 
    final value = getInherit<DataProviderInherited>(context)?.value ?? 0;

    return Text('$value');
  }
}

 T? getInherit<T>(BuildContext context) {
   final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
   final widget = element?.widget;

   if(widget is T) {
     return widget as T;
   } else {
     return null;
   }
 }