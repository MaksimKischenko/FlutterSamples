import 'package:hive_flutter/hive_flutter.dart';

class ExampleAdapterModel {
  ExampleAdapterModel()  {
    Hive.registerAdapter(UserAdapter());

  }

  void doSome() async{
    var box = await Hive.openBox<User>('textBox2'); 
    final user =  User('Ivan', 34);
    await box.add(user);
    print(box.values);
  }
}

class User {
  String name;
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