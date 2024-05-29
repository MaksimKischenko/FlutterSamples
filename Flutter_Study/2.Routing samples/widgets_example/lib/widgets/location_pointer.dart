import 'package:flutter/material.dart';

class LocationPointer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black12,
      ),
      //child: Center(child: Icon(Icons.place, color: Colors.white)),
    );
  }
}
