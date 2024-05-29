

import 'package:flutter/material.dart';

import 'navigation.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Text('2'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ElevatedButton(
                    onPressed: Navigation.toPage3, 
                    child: Text('Next')
                  ),
                  ElevatedButton(
                    onPressed: Navigation.toPage1, 
                    child: Text('Back')
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
