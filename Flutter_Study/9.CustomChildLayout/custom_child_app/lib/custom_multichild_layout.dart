import 'package:flutter/cupertino.dart';

// class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {



//   @override
//   Size getSize(BoxConstraints constraints) { // может переопределить свой положение 
//     return Size(constraints.biggest.width, 100);
//   }

//   @override
//   void performLayout(Size size) {
//     if(hasChild(1) && hasChild(2) && hasChild(3)) { //проверка на элементы
//       layoutChild(1, BoxConstraints.loose(size)); //попросим нашего ребенка посчитать свой размер в условиях его constraints
//       layoutChild(2, BoxConstraints.tight(Size(50, size.height)));
//       layoutChild(3, BoxConstraints.loose(size)); //либо такой же размер либо меньший если ему комфортно


//       //позиционирование 
//       positionChild(1, const Offset(0,50));
//       positionChild(2, const Offset(100,-50));
//       positionChild(3, const Offset(300,0));
//     }
//   }

//   @override
//   bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
//     return true;
//   }
// }



class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {

  @override
  Size getSize(BoxConstraints constraints) { 
    return Size(constraints.biggest.width, 100);
  }

  @override
  void performLayout(Size size) {
    if(hasChild(1) && hasChild(2) && hasChild(3)) { 


      //Работа с левым элементом
      final minOtherElementWidth = 50; 
      final firstElementMaxWidth = size.width - minOtherElementWidth * 2;
      final firstElementSize = layoutChild(1, BoxConstraints.loose(Size(firstElementMaxWidth, size.height))); 




      layoutChild(2, BoxConstraints.tight(Size(50, size.height)));
      layoutChild(3, BoxConstraints.loose(size)); 


      //позиционирование 
      positionChild(1, const Offset(0,50));
      positionChild(2, const Offset(100,-50));
      positionChild(3, const Offset(300,0));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}