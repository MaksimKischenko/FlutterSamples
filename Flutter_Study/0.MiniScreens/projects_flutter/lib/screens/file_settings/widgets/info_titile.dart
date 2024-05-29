import 'package:flutter/material.dart';

class InfoTitle extends StatelessWidget {
  final String title;
  const InfoTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffE5E5E5),
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
      child: Text(title,
          style: TextStyle(
              color: Color(0xff39434C).withOpacity(0.3), fontSize: 14)),
    );
  }
}
