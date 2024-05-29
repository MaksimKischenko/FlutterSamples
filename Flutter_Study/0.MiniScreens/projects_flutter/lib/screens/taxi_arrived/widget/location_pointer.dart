import 'package:flutter/material.dart';

class LocationPointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          color: Color.fromRGBO(68, 138, 255, 0.3),
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ));
  }
}
