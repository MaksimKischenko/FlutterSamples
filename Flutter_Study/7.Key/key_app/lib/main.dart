import 'package:flutter/material.dart';
import 'package:key_app/global_key.dart';
import 'package:key_app/position_widget.dart';
import 'package:key_app/reordered_list.dart';
import 'package:key_app/share_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: 
        // PositionedTitles()
        // ReorderedExample()
        // SafeArea(child: ExampleGlobalKey())
        ShareStateGlobal()
      ),
    );
  }
}

