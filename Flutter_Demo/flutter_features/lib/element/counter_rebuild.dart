import 'dart:developer';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  CounterWidgetState createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final element = context.widget.createElement();
    // element.mount(parent, newSlot);
    // element.update(Container());
    // element.deactivate();
    // element.activate();
    log('CounterWidget: ${widget.hashCode}');
    log('Element: ${element}');
    return Scaffold(
      key: UniqueKey(), 
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterRebuild(counter: _counter),
            OutlinedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}


class CounterRebuild extends StatelessWidget {
  final int counter;

  const CounterRebuild({super.key, required this.counter});
  @override
  Widget build(BuildContext context) {
    log('CounterRebuild: ${(context as Element).hashCode}');
    return Text(counter.toString());
  }
}