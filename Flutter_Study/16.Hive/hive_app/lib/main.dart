import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'example_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //если main async
  await Hive.initFlutter(); //сам выбирает путь инициализации 
  runApp(const MyApp());
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
      home: const ExampleWidget(),
    );
  }
}

