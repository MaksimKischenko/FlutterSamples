
import 'package:flutter/cupertino.dart';
import 'package:hive_app/model/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExampleListanableModel {
  Future<Box<User>>? userBox;

  void setUp() async{
     Hive.registerAdapter(UserAdapter());
     userBox =  Hive.openBox<User>('user_box');
     userBox?.then((box) {
       box.listenable().addListener(() {
         print(box.length);
       }); //слушаем весь бокс . узнаем когда что то поменялось 
     });
  }

  void doSome() async{
    final box = await userBox;
    final user = User('Ivan', 11);
    await box?.add(user);
  }
}

@HiveType(typeId: 0)
class User extends HiveObject {

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  User(this.name, this.age);

  @override
  String toString() => 'Name: $name, Age: $age'; 
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    final name = reader.readString();
    final age = reader.readInt();
    return User(name, age);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
  }
}


//InheritedNotifier - можно туда завернуть Listanable и он будет перерисовывать интерфейс 