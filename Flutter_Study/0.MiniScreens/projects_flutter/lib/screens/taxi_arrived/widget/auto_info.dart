import 'package:flutter/material.dart';

class AutoInfo extends StatelessWidget {
  final String number;
  final String model;

  const AutoInfo({required this.number, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: Color.fromRGBO(232, 232, 232, 1),
              borderRadius: BorderRadius.circular(100)),
          child: Text(number,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
        ),
        Text(model,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
