import 'package:flutter/material.dart';

class Example1 extends StatefulWidget {
  const Example1({ Key? key }) : super(key: key);

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: CustomPaint(
            painter: MyPainter(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {


  //canvas = холст на котором мы рисуем 
  //offset = смещение 
  //paint - задает стиль примитивам 
  //paint.isAntiAlias - улучшение качества и уменьшение пикселей 
  //paint.style - stroke - обводка / fill - заливка 
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.green;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;
    //canvas.drawCircle(Offset(size.width /2, size.height /2), size.width / 2, paint);
    canvas.drawRect(const Offset(5,5) & const Size(30, 30), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}