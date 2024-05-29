import 'dart:async';

import 'package:universal_realism_art/app.dart';
import 'package:universal_realism_art/app_injector.dart';
import 'package:universal_realism_art/app_wrapper.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'presentation/bloc/simple_bloc_observer.dart';

Future<void> bootstrap() async {
  await AppInjector.run(); 
  Bloc.observer = SimpleBlocObserver();
  Bloc.transformer = sequential<dynamic>();    
  runApp(const AppWrapper(child: App()));      
}

