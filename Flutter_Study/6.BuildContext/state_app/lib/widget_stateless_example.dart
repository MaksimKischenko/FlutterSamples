import 'package:flutter/material.dart';

class WidgetStatelessExample extends StatelessWidget {

  WidgetStatelessExample({ Key? key }) : super(key: key);

  bool colorsChanger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Change state in stateless'
        ),
      ),
      body: Center(
        child:  GestureDetector(
          child: Container(
            width: 50,
            height: 50,
            color: colorsChanger? Colors.red: Colors.blue,
          ),
          onTap: () {
            colorsChanger = !colorsChanger;

            (context as Element).markNeedsBuild();
          },
        ),
      ),
    );
  }
}