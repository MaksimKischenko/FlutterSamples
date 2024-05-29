import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  final Function() onTap;

  const CallButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        padding:
            EdgeInsets.symmetric(horizontal: 8, vertical: 22), //! heigth???
        minWidth: double.maxFinite,
        onPressed: onTap,
        elevation: 0,
        color: Theme.of(context).primaryColor,
        child: Text('Press here to get a call',
            style: TextStyle(color: Colors.white, fontSize: 18)));
  }
}
