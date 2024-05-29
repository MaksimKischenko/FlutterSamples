// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository{

  var _user = User(age: 0);
  User get user => _user;

  Future<void> loadValue() async {
    final shPref = await SharedPreferences.getInstance();
    final age = shPref.getInt('age') ?? 0;
    _user = User(age: age);
  }
  
  void incrementAge() {
    _user = _user.copyWith(age: _user.age + 1);
  }

  void saveValue() async{
    final shPref = await SharedPreferences.getInstance();
    shPref.setInt('age', _user.age);    
  }

  void decrementAge() {
    _user = _user.copyWith(age: max(_user.age - 1, 0));
  } 
}

class User {
  final int age;

  User({
    required this.age,
  });

  User copyWith({
    int? age,
  }) {
    return User(
      age: age ?? this.age,
    );
  }
}
