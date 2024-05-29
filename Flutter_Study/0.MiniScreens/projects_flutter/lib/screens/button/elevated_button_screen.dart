import 'package:flutter/material.dart';

class MyElevatedButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('CLICK', style: TextStyle(fontSize: 22)),
          onPressed: () {
            Text('Hello');
          },
        ),
      ),
    );
  }
}

abstract class Car {
  Future<void> carCounter() {
    return Future.delayed(Duration(seconds: 3), () => print('Hello'));
  }
}
