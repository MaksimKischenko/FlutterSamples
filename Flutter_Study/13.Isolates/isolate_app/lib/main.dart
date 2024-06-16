// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:isolate';

import 'package:flutter/material.dart';

final dataDisplayWidgetKey = GlobalKey<DataDisplayWidgetState>();
Future<void> main() async{
  runApp(const MyApp());

  final receivePort = ReceivePort();
  // Запускаем изолят для выполнения долгой операции.
  Isolate.spawn(fetchDataIsolate, receivePort.sendPort, debugName: 'ISOLATE');
  // Отправляем порт изолюта в основной изолят.
  listenIsolate(receivePort);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: const Text('LOADING'),
        ),
        body: Center(
          child: DataDisplayWidget(
            key: dataDisplayWidgetKey,
          ),
        ),
      ),
    );
  }
}

class DataDisplayWidget extends StatefulWidget {
  const DataDisplayWidget({super.key});

  @override
  DataDisplayWidgetState createState() => DataDisplayWidgetState();
}

class DataDisplayWidgetState extends State<DataDisplayWidget> {
  String data = 'Ожидаем загрузки';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoading? const CircularProgressIndicator() : const FlutterLogo(),
        const SizedBox(height: 16.0),
        Text(data),
      ],
    );
  }

  void updateData(int newData) {
    setState(() {
      data = newData.toString();
      isLoading = newData < 600000;
    });
  }
}


Future<void> fetchDataIsolate(SendPort sendPort) async{
  for (var i = 0; i < 600000; i++) {
    await Future.delayed(const Duration(seconds: 1));
    sendPort.send(User(age: i));
    print(i);
  }
}

void listenIsolate(ReceivePort receivePort) async {
  receivePort.listen((data) {
    // Получили данные из изолята и обновляем виджет с данными.
    if (data is User) {
      dataDisplayWidgetKey.currentState?.updateData(data.age);
    }
  });
}


class User {
  final int age;
  User({
    required this.age,
  });
}




