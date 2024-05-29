import 'package:flutter/material.dart';

class MyTextButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: TextButton(
          child: Text('Hello'),
          style: TextButton.styleFrom(shadowColor: Colors.amber),
          onPressed: () {
            print('HELLOOOOOO');
          },
        ),
      ),
    );
  }
}
