import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider2_simple_example.dart';

import 'provider1_simple_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: ChangeNotifierProvider(
        create: (_) => ViewModel(),
        child: const SimpleExampleWidget()
      ),
    );
  }
}

class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true
      ),
      home: const Scaffold(body: SimpleExampleWidget2())
    );
  }
}

