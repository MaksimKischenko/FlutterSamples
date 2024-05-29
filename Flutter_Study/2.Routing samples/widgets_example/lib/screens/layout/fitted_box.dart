import 'package:flutter/material.dart';

class FittedBoxExample extends StatelessWidget {
  
  static String routName = '/_layoutDemos/01_fittedBox';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FittedBox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 300,
                height: 150,
                color: Colors.red,
                child: Text('WITHOUT FITTEDBOX',
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),              
                ),
              ),
              Container(
                width: 300,
                height: 150,
                color: Colors.red,
                child: FittedBox(
                  child: Text('WITH FITTEDBOX',
                    style: TextStyle(
                      fontSize: 100,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),              
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}