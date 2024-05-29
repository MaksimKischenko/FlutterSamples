// Было бы лучше, если бы мы просто перерисовывали определенные RenderObjects. 
//Использование RepaintBoundary может быть полезным для ограничения создания markNeedsPaint 
//вверх по дереву рендеринга и paintChild вниз по дереву рендеринга.

import 'package:flutter/material.dart';
import 'dart:math';

class CursorPointer extends CustomPainter {

  final Offset _offset;

  CursorPointer(this._offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      _offset,
      10.0,
      Paint()..color = Colors.green,
    );
  }

  @override
  bool shouldRepaint(CursorPointer old) => old._offset != _offset;
}

class BackgroundColor extends CustomPainter {

  static const List<Color> colors = [
    Colors.orange,
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.red,
  ];

  Size _size;
  BackgroundColor(this._size);

  @override
  void paint(Canvas canvas, Size size) {
    final Random rand = Random(12345);

    for (int i = 0; i < 10000; i++) {
      canvas.drawOval(
          Rect.fromCenter(
            center: Offset(
              rand.nextDouble() * _size.width - 100,
              rand.nextDouble() * _size.height,
            ),
            width: rand.nextDouble() * rand.nextInt(150) + 200,
            height: rand.nextDouble() * rand.nextInt(150) + 200,
          ),
          Paint()
            ..color = colors[rand.nextInt(colors.length)].withOpacity(0.3)
      );
    }
  }

  @override
  bool shouldRepaint(BackgroundColor other) => false;
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey _paintKey =  GlobalKey();
  Offset _offset = Offset.zero;

  Widget _buildBackground() {
    return RepaintBoundary(
      child: CustomPaint(
        painter:  BackgroundColor(MediaQuery.of(context).size),
        isComplex: true,
        willChange: false,
      ),
    );
  }

  Widget _buildCursor() {
    return Listener(
      onPointerDown: _updateOffset,
      onPointerMove: _updateOffset,
      child: CustomPaint(
        key: _paintKey,
        painter: CursorPointer(_offset),
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: const Text('Flutter RepaintBoundary Demo'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildBackground(),
          _buildCursor(),
        ],
      ),
    );
  }

  _updateOffset(PointerEvent event) {
    RenderBox? referenceBox = _paintKey.currentContext?.findRenderObject() as RenderBox;
    Offset offset = referenceBox.globalToLocal(event.position);
    setState(() {
      _offset = offset;
    });
  }
}