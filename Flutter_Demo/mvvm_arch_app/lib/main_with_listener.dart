import 'dart:developer';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:mvvm_arch_app/ui/models/notifier_builder.dart';
import 'package:mvvm_arch_app/ui/providers/data_provider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FlightWidget()
      ),
    );
  }
}


class FlightWidget extends StatefulWidget {
  const FlightWidget({super.key});

  @override
  State<FlightWidget> createState() => _FlightWidgetState();
}

class _FlightWidgetState extends State<FlightWidget> {

  DataProvider? _dataProvider;


  //didChangeDependencies иначе ошибка dependOnInheritedWidgetOfExactType<_InheritedProviderScope<DataProvider?>>() 
  //or dependOnInheritedElement() was called before _FlightWidgetState.initState() completed.

  //f [listen] is true, later value changes will trigger a new [State.build] to widgets, 
  //and [State.didChangeDependencies] for [StatefulWidget].
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _dataProvider ??= Provider.of<DataProvider>(context, listen: true)
    ..fetchFlights()
    ..addListener(() { 
      log('FlightWidget: ${_dataProvider?.flights}');
    });
  }



  @override
  void dispose() {
    _dataProvider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Flights: ${_dataProvider?.flights}')),
    );
  }
}