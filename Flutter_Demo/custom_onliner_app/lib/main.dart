import 'package:custom_onliner_app/bloc/goods_bloc.dart';
import 'package:custom_onliner_app/data/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_observer.dart';
import 'injection_component.dart';
import 'show_goods_screen.dart';

void main() {

  InjectionComponent.run();
  
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider<GoodsBloc>(
          create: (context) => GoodsBloc(
            dataManager: InjectionComponent.getDependency<DataManager>()
          )
        ),
      ], child: const MyApp())),
    blocObserver: SimpleBlocObserver(),
    eventTransformer: sequential<dynamic>()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShowGoodsScreen(),
    );
  }
}

