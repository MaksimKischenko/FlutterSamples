import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSwitchWidget extends StatefulWidget {
  @override
  _CupertinoSwitchWidgetState createState() => _CupertinoSwitchWidgetState();
}

class _CupertinoSwitchWidgetState extends State<CupertinoSwitchWidget> {
  var _lights = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: _lights,
      activeColor: Color(0xff47A7FF),
      onChanged: (value) {
        setState(() {
          _lights = value;
        });
      },
    );
  }
}
