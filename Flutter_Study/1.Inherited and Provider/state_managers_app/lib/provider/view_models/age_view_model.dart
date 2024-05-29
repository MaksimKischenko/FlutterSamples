import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgeViewModel with ChangeNotifier { 
  var _age = 0;
  int get age => _age;

  void loadValue() async {
    final sharedPreferences =  await SharedPreferences.getInstance();
    _age = sharedPreferences.getInt('age') ?? 0;
    notifyListeners();
  }

  AgeViewModel() {
    loadValue();
  }

  void incrementAge() async {
    _age+=1;
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('age', _age);
    notifyListeners();
  }
  void decrementtAge() async {
    _age = max(_age -1, 0);
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('age', _age);
    notifyListeners();
  }
}