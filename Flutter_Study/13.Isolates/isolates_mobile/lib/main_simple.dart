import 'dart:async';
import 'package:flutter/material.dart';

final dataDisplayWidgetKey = GlobalKey<_DataDisplayWidgetState>();
Future<void> main() async{
  runApp(const MyApp());
  await Future.delayed(const Duration(seconds: 5));
  final result = calculateLongTask();
  await runAppWithoutIsolate(result);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Isolate Example'),
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
  // ignore: library_private_types_in_public_api
  _DataDisplayWidgetState createState() => _DataDisplayWidgetState();
}

class _DataDisplayWidgetState extends State<DataDisplayWidget> {
  String data = 'Ожидание данных...';
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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

Future<int> calculateLongTask() async {
  int result = 0;
  for (var i = 0; i < 600000; i++) {
    Future.delayed(const Duration(milliseconds: 500));
    result = i;
    print(i);
      
  }
  return result;
}

Future<void> runAppWithoutIsolate(Future<int> result) async {

  final resultData = await result;
  
  // Получили результат долгого вычисления и обновляем виджет с данными.
  dataDisplayWidgetKey.currentState?.updateData(resultData);
}

