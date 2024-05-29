import 'package:flutter/material.dart';

class OwnSingleChildLayoutDelegate extends SingleChildLayoutDelegate {


  //первый возвращает размеры CustomSingleChildLayout (собственный размер)
  //но для начала он принимает constraints которые ему достаются от родителя 
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.biggest.width, 100);
  }

  //constraints достаются от родителя.

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    //скажем ребенку занять все доступное пространтство или ограниченное SIZE [хоть сам он хочет быть 100 на 100]
    return BoxConstraints.tight(const Size(50,50));
  }

  //отсупы слева и сверху [0.0 левый верхний угол]
  @override
  Offset getPositionForChild(Size size, Size childSize) {

    final yoffset = size.height / 2 -childSize.height /2; //посередине
    return Offset(childSize.width, yoffset);
  }

  //позиционирование на основе ширины экрана и тд
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }

}

