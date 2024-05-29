import 'package:flutter/material.dart';

class ConstrainedBoxExample extends StatelessWidget {
  
  static String routName = '/_layoutDemos/02_constrainedBox';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Without ConstrainedBox',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,    
                style: TextStyle(fontSize: 26) 
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 300),
                child: Text(
                  'Данный тип контейнеров применяется, когда нам надо ограничить виджет определенной областью.Например, виджет Text по умолчанию растягивается по всей длине и ширине контейнера',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,    
                  style: TextStyle(fontSize: 26) 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}