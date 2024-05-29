import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String text;

  CategoryTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
    );
  }
}
