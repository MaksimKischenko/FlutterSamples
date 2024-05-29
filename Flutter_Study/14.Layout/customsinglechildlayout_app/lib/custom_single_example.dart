

import 'package:flutter/material.dart';

class CustomSingleChildLayoutExample extends StatelessWidget {
  const CustomSingleChildLayoutExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: CustomSingleChildLayout(
            delegate: OwnSingleChildLayoutDelegate(),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class OwnSingleChildLayoutDelegate extends SingleChildLayoutDelegate {

  @override
  Size getSize(BoxConstraints constraints) {

    return Size(constraints.biggest.width, 100);
  } //берет ограничения родителя и по умолчанию возвращает максимальные 

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(const Size(50,50));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return const Offset(150, 200);
  }
  //позиция - отступы слева и сверху. По началу 0 и он в левом верхенм углу

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }
}