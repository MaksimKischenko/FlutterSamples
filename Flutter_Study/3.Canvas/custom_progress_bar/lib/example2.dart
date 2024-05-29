import 'dart:math';

import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({ Key? key }) : super(key: key);

  @override
  _Example2State createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            child: const RadialPercentWidget(
              percent: 0.72,
              fillColor: Colors.blue,
              lineColor: Colors.red,
              freeColor: Colors.yellow,
              lineWidth: 5,
              child: Text('72%', style: TextStyle(color: Colors.white)
             )
            )
          ),
        ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {

  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  const RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand, //занять как можно больше свободного места
      children: [
        CustomPaint(
          painter: MyPainter(
            percent: percent, 
            fillColor: fillColor, 
            lineColor: lineColor, 
            freeColor: freeColor, 
            lineWidth: lineWidth
          )
        ),
        Padding(
          padding: const EdgeInsets.all(11),
          child: Center(child: child),
        )
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  MyPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });


  @override
  void paint(Canvas canvas, Size size) {

    final backGroundPaint = Paint();
    backGroundPaint.color = fillColor;
    backGroundPaint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backGroundPaint);

    final filedPaint = Paint();
    filedPaint.color = freeColor;
    filedPaint.style = PaintingStyle.stroke;
    filedPaint.strokeWidth = lineWidth;
    canvas.drawArc( 
      const Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11), 
      pi * 2 * percent - (pi / 2), 
      pi * 2 * (1.0- percent), 
      false, 
      filedPaint
    );

    final fillPaint = Paint();
    fillPaint.color = lineColor;
    fillPaint.style = PaintingStyle.stroke;
    fillPaint.strokeWidth = lineWidth;
    fillPaint.strokeCap = StrokeCap.round; // окончание линии
    canvas.drawArc( 
      const Offset(5.5, 5.5) & Size(size.width - 11, size.height - 11), 
      -pi / 2, // задаем радианы
      pi * 2 * percent, 
      false, 
      fillPaint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
