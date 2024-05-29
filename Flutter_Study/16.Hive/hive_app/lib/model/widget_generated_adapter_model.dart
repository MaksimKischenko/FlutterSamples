import 'package:hive_flutter/hive_flutter.dart';

part 'widget_generated_adapter_model.g.dart';

class ExampleGeneratedAdapterModel {

  ExampleGeneratedAdapterModel()  {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(PetAdapter());
  }

  void doSome() async{
    var box = await Hive.openBox<User>('textBoxUser'); 
    var petBox = await Hive.openBox<Pet>('petBox');

    final pet = Pet('Nono');
    petBox.add(pet);

    final pets = HiveList(petBox, objects: [pet]);
    var user = User('Ivan', 33, pets);

    await box.put('user', user); 

    print(box.values);

  }
}


@HiveType(typeId: 0)
class User extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(3)
  HiveList<Pet> pets;

  User(this.name, this.age, this.pets);

  @override
  String toString() => 'Name: $name, Age: $age, Pets: $pets'; 
}

@HiveType(typeId: 1)
class Pet extends HiveObject {

  @HiveField(0)
  String name;

  Pet(this.name);

  @override
  String toString() => 'Name: $name'; 
}

