import 'package:flutter/material.dart';

class AspectRatioExample extends StatelessWidget {
  
  static String routName = '/_layoutDemos/05_aspRatio';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio'),
        centerTitle: true,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1/1, //video 16/9
          child: Container(color: Colors.orange),
        ),
      )
    );
  }
}