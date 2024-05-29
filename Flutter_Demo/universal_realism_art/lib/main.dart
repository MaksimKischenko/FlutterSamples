import 'dart:async';


import 'package:universal_realism_art/bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.leanBack
   );
  await bootstrap();
}

