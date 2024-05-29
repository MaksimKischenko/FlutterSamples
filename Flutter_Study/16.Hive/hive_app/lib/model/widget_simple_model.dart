import 'package:hive_flutter/hive_flutter.dart';

class ExampleSimpleModel {
  ExampleSimpleModel()  {
  }

  void doSome() async{
    var box = await Hive.openBox<dynamic>('textBox'); //открываем Бокс
    Hive.box('testBox'); //получаем открытый Бокс

    await box.put('name', 'Ivan');
    final name = box.get('name');

    final index = await box.add([1,4,5,6]);
    final list = box.getAt(index);

    box.deleteAt(index);
    box.clear();
    await box.deleteFromDisk();
    
  }
}