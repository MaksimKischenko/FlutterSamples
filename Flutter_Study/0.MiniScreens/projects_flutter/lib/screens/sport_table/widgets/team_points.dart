import 'package:flutter/material.dart';

class TeamPoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
      child: Row(
        children: [
          SizedBox(width: 8),
          Text('#'),
          SizedBox(width: 12),
          Text('Team'),
          SizedBox(width: 104),
          Text('D'),
          SizedBox(width: 18),
          Text('L'),
          SizedBox(width: 18),
          Text('Ga'),
          SizedBox(width: 18),
          Text('Gd'),
          SizedBox(width: 18),
          Text('Pts'),
        ],
      ),
    );
  }
}
