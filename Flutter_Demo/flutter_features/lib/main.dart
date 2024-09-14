import 'package:flutter/material.dart';

import 'ui/overlay/blinking_toast_widget.dart';


void main() {
  runApp(const MyMainApp());
}

class MyMainApp extends StatelessWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BlinkingToastWidget(
        widget: Icon(Icons.home),
        position: Offset(0, 1),
      ),
    );
  }
}