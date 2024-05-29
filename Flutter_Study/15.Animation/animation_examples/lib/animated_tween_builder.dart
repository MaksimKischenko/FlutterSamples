import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double targetValue = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>( //color 
          tween: Tween<double>(begin: 0, end: targetValue),
          curve: Curves.linearToEaseOut,
          duration: const Duration(seconds: 1),
          builder: (BuildContext context, double size, Widget? child) {
            return IconButton(
              iconSize: size,
              color: Colors.blue,
              icon: child!,
              onPressed: () {
                setState(() {
                  targetValue = targetValue == 24.0 ? 88.0 : 24.0;
                });
              },
            );
          },
          child: const Icon(Icons.aspect_ratio),
        ),
      ),
    );
  }
}
