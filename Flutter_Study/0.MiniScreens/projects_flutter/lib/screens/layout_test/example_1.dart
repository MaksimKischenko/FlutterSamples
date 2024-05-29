import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({ Key? key }) : super(key: key);

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {

  @override
  Widget build(BuildContext context) {

    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: totalWidth, maxHeight: totalHeight),
          child: Container(
            color: Colors.red,
            height: 100,
            width: 100,
            child: Container(
              color: Colors.blue,
              height: 80,
              width: 80,
              child: Container(
                color: Colors.orange,
                height: 60,
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text('1')),
                    Text('2'),
                    Text('3'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}