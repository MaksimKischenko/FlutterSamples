import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _value = 0;
  @override
  Widget build(BuildContext context) {
    log('BUILD');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        children: [
          Expanded(
            child: MyCounter(
              onChanged: (value) {
                setState(() {
                  _value = value;
                  debugPrint(value.toString());
                });
              },
            ),
          ),
          Text(_value.toString())
        ],
      )
    );
  }
}


class MyCounter extends StatefulWidget {
  const MyCounter({super.key, required this.onChanged});

  final ValueChanged<int> onChanged;


  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('+'),
          onPressed: () {
            widget.onChanged(count++);
          },
        ),
      ),
    );
  }
}