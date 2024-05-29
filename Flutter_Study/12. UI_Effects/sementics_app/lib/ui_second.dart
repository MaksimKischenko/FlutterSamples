
import 'package:flutter/material.dart';

class UiSecond extends StatefulWidget {
  const UiSecond({Key? key}) : super(key: key);

  @override
  State<UiSecond> createState() => _UiSecondState();
}

class _UiSecondState extends State<UiSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MergeSemantics(
          child: Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              const Text('Settings'),
            ],
          ),
        ),
      )
    );
  }
}