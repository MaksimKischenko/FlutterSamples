// class Car {  
//   Wheel wheel = Wheel();    
   
//    drive() {    
//       wheel.spin();  
//    }
// }

class Wheel {

  void spin() {
    print('SPIN');
  }
}


class Car {
   
   final Wheel wheel;

   Car(this.wheel);
   drive() {   
      wheel.spin();
   }
}