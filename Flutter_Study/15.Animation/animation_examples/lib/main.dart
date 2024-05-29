import 'package:animation_examples/animated_builder.dart';
import 'package:animation_examples/animated_container.dart';
import 'package:animation_examples/animated_controller.dart';
import 'package:animation_examples/animated_opasity.dart';
import 'package:animation_examples/animated_padding.dart';
import 'package:animation_examples/animated_positioned.dart';
import 'package:animation_examples/animated_rotation_transition.dart';
import 'package:animation_examples/animated_tween_builder.dart';
import 'package:animation_examples/animated_widget.dart';
import 'package:flutter/material.dart';

void main() {
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
      home: 
      // const AnimatedRotationTransition()
      //const AnimatedContainerExample()
      // const MyStatefulWidget(),
      //const MyStatefulWidget2(),
      //const MyStatefulWidget3(),
      // const LogoApp(),
      //const LogoApp2(),
      const AnimatedBuilderExample(),
      // const LogoApp4(),
    );
  }
}

