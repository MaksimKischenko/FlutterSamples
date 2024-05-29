// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

void main() {
  final completer = Completer<User>();
  
  // Асинхронная операция, которая завершит Future через 2 секунды.
  Future.delayed(Duration(seconds: 2), () {
    completer.complete(User(age: 100, name: 'Max')); // Устанавливаем значение Future.
  });
  
  completer.future.then((value) {
    print('Завершено: $value'); // Выполняется, когда Future завершится.
  });
}


class User {
  final int age;
  final String name;

  const User({
    required this.age,
    required this.name,
  });
  

  @override
  String toString() => 'User(age: $age, name: $name)';
}
