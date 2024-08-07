import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  final String? location;

  Location({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location ?? 'None location',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
