
import 'package:flutter/material.dart';

class MaterialStateColorExample extends StatelessWidget {
  const MaterialStateColorExample({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton (             
              onPressed: () async {
                await Navigator.pushNamed(context, '/listtile/' ); 
              },
              child: const Text('GO Next',style: TextStyle(fontSize: 32, color: Colors.white)),
              style: const ButtonStyle(
                backgroundColor: MyColor()
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyColor extends MaterialStateColor {
  const MyColor() : super(_defaultColor);

  static const int _defaultColor = 0xff478B79;
  static const int _pressedColor = 0xffA5B51D;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return const Color(_pressedColor);
    }
    return const Color(_defaultColor);
  }
}