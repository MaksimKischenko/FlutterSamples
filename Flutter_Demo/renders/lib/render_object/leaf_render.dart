import 'package:flutter/material.dart';

///[LeafRenderObjectWidget] — это абстрактный класс в Flutter, который служит базовым классом 
///для виджетов, непосредственно управляющих своими собственными рендерингами 
///и не имеющих дочерних виджетов. Такие виджеты являются конечными элементами в дереве рендеринга 
///и не имеют потомков.

//Этот виджет полезен, когда вам нужно создать кастомный виджет, 
///который непосредственно управляет процессом рендеринга, но не содержит других виджетов внутри себя.


// Создаем класс MyCircleWidget, который наследует от LeafRenderObjectWidget
class MyCircleWidget extends LeafRenderObjectWidget {
  final double radius;
  final Color color;

  const MyCircleWidget({
    required this.radius,
    required this.color,
  });

  @override
  RenderObject createRenderObject(BuildContext context) => RenderMyCircle(radius: radius, color: color);

  @override
  void updateRenderObject(BuildContext context, covariant RenderMyCircle renderObject) {
    renderObject
      ..radius = radius
      ..color = color;
  } 
}

///[RenderBox] — это класс в Flutter, который является базовым классом для объектов, 
///участвующих в системе рендеринга. Он предоставляет функциональность для определения размеров 
///и положения объектов в дереве рендеринга. RenderBox расширяет класс RenderObject и добавляет 
///дополнительные возможности, такие как определение размеров, вычисление ограничений и управление 
///поведением при перерисовке.
class RenderMyCircle extends RenderBox {
  double _radius;
  Color _color;

  RenderMyCircle({
    required double radius,
    required Color color,
  })  : _radius = radius,
        _color = color;

  double get radius => _radius;
  set radius(double value) {
    if (_radius != value) {
      _radius = value;
      ///[markNeedsPaint] — это метод в классе RenderObject (и его подкласе RenderBox) в Flutter, 
      ///который сообщает системе рендеринга, что текущий объект рендеринга (или его часть) необходимо 
      ///перерисовать. Этот метод используется, когда состояние рендер-объекта изменилось, 
      ///и его необходимо обновить на экране.
      markNeedsPaint();
    }
  }

  Color get color => _color;
  set color(Color value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = constraints.constrain(Size(_radius * 2, _radius * 2));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final paint = Paint()
      ..color = _color
      ..style = PaintingStyle.fill;
    context.canvas.drawCircle(offset + Offset(radius, radius), radius, paint);
  }
}