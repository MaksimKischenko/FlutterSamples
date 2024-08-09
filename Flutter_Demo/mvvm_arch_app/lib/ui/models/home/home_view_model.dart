

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_arch_app/ui/models/models.dart';

import 'home_state.dart';

class HomeViewModel extends ValueNotifier<HomeViewModelState> with Mountable {
  HomeViewModel(): super(
    const HomeViewModelState(
      isFirstLoad: false,
      args: []  
    ) 
  ) {
    log('ARGS: ${value.args}/ isFirstLoad: ${value.isFirstLoad}');
  }

  Future<void> initState() async {
    value = value.copyWith(isFirstLoad: true, args: ['first']);
    notifyListeners();
    
  }

  Future<void> addArg(String arg) async {
    value = value.copyWith(args: [...value.args, arg]);
    notifyListeners();
  }
}