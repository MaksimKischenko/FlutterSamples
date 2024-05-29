import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCupertinoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: CupertinoActivityIndicator(
            radius: 20,
          ),
        ),
      ),
    );
  }
}
