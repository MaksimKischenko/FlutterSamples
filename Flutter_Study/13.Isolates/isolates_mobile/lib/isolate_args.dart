
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isolates_mobile/data.dart';

final dataDisplayWidgetKey = GlobalKey<DataDisplayWidgetState>();


Future<dynamic> computeIsolate(Future Function(int i) function) async {
  final receivePort = ReceivePort();
  var rootToken = RootIsolateToken.instance!;
  Isolate.spawn<IsolateData>(
    fetchDataIsolate,
    IsolateData(
      token: rootToken,
      function: function,
      answerPort: receivePort.sendPort,
    ),
  );
  return receivePort;
}

Future<void> main() async{
  runApp(const MyApp());
  var port = await computeIsolate(_getUser); 
   if(port is ReceivePort) {
    port.listen((message) {
      if(message is SimpleUser) {
       dataDisplayWidgetKey.currentState?.updateData(message.age);
      }
    });
  }       
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


Future<void> fetchDataIsolate(IsolateData isolateData) async{
  BackgroundIsolateBinaryMessenger.ensureInitialized(isolateData.token);
  for (var i = 0; i < 600000; i++) {
   await Future.delayed(const Duration(milliseconds: 500)); 
    final user = await isolateData.function(i);
    isolateData.answerPort.send(user);   
    print(user);  
  }            

}

Future<SimpleUser?> _getUser(int i) async {
  var user =  SimpleUser(age: i, test: ActionCategories.available);
  return user;
}



