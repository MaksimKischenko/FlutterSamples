//Inherit цельный кусок и обновляет сразу всю информацию подписанных дочерних подвиджетов но не конкретную!!!
//Это значит что он будет перестраивать даже тот виджет который и не изменился!




import 'package:flutter/material.dart';

class WithInheritModelExample extends StatelessWidget {
  const WithInheritModelExample({ Key? key }) : super(key: key);

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

  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrimentOne() {
    _valueOne +=1;
    setState(() {
      
    });
  }

  void _incrimentTwo() {
    _valueTwo +=1;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _incrimentOne, 
          child: const Text('One+')
        ),
        ElevatedButton(
          onPressed: _incrimentTwo, 
          child: const Text('Two+')
        ),
        DataProviderInherited(
          valueOne: _valueOne,
          valueTwo: _valueTwo,
          child: const DataConsumerStateless()
        )
      ],
    );
  }
}

class DataProviderInherited extends InheritedModel<String> {

  final int valueOne;
  final int valueTwo;

  const DataProviderInherited({
      Key? key, 
      required this.valueOne,
      required this.valueTwo,
      required Widget child
    }) : super(key: key, child: child);

  
  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne ||  valueTwo != oldWidget.valueTwo;
  }

  //аспекты = зависимости
  @override
  bool updateShouldNotifyDependent(DataProviderInherited oldWidget, Set dependencies) {

    final isValueOneApdated = valueOne != oldWidget.valueOne && dependencies.contains('One');
    final isValueTwoApdated = valueTwo != oldWidget.valueTwo && dependencies.contains('Two');
    return isValueOneApdated || isValueTwoApdated;
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // аспект это ключ зависимость (только если обновляется этот аспект)
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'One')?.valueOne ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('$value'),
        const DataConsumerStatefull()
        
      ],
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
  const DataConsumerStatefull({ Key? key }) : super(key: key);

  @override
  _DataConsumerStatefullState createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {

    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'Two')?.valueTwo ?? 0;
    return Text('$value');
  }
}

