import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({ Key? key }) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: differentButtons()),
    );
  }
}

Widget differentButtons() {
  return ElevatedButton(
    onPressed: () {}, 
    child: const Text('TAP'),
    style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(80),
        primary: Colors.amber,
        onSurface: Colors.black,
        elevation: 20,
        enabledMouseCursor: SystemMouseCursors.zoomIn
     ),
  );
}