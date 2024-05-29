

import 'package:flutter/material.dart';

import 'navigation.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('1'),
              ElevatedButton(
                onPressed: Navigation.toPage2, 
                child: Text('Next')
              )
            ],
          ),
        ),
      )
    );
  }
}