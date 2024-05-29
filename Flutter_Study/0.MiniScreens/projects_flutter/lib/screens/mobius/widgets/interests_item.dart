import 'package:bubble/bubble.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';

class InterestsItem extends StatelessWidget {
  final String title;

  const InterestsItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Chip(
      padding: EdgeInsets.symmetric(horizontal: 8),
      backgroundColor: Color.fromRGBO(232, 232, 232, 1),
      label: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          )),
    ));
  }
}
