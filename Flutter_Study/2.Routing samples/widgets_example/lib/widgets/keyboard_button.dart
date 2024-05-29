import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  const KeyboardButton({
    Key? key,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black),
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Colors.black))),
          onPressed: onTap,
          child: child),
    );
  }
}
