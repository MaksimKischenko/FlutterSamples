import 'package:flutter/material.dart';

class CategorySubtitle extends StatelessWidget {
  final String text;

  CategorySubtitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black.withOpacity(0.55))),
    );
  }
}
