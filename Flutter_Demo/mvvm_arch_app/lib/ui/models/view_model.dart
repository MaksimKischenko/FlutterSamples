// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/repositories/repositories.dart';

class ViewModelState {
  final String ageTitle;

  ViewModelState({
    required this.ageTitle,
  });
  
}

class ViewModel extends ChangeNotifier {

  final userRepository = UserRepository();
  var _state = ViewModelState(ageTitle: '');
  ViewModelState get state => _state;

  void loadValue() async{
    await userRepository.loadValue();
    _updateState();
  }
  
  ViewModel() {
    loadValue();
  }

  Future<void> onDecremenButtonPressed() async {
    userRepository.decrementAge();
    _updateState();
  }

  Future<void> onIncrementButtonPressed() async {
    userRepository.incrementAge();
    _updateState();
  }

  void _updateState() {
    final user = userRepository.user;
    _state = ViewModelState(ageTitle: user.age.toString()); 
    notifyListeners();
  }
}