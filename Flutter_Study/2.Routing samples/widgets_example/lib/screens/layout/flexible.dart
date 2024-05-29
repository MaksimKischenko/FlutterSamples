import 'package:flutter/material.dart';

class FlexibleExample extends StatelessWidget {
  
  static String routName = '/_layoutDemos/04_flexible';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flexible'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Center(
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                )
              ),
              Flexible(
                flex: 4,
                child: Container(
                  color: Colors.orange,
                )
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.red,
                ) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}