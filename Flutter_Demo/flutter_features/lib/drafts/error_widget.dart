import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (details) =>  Container();
    return const Placeholder();
  }
}

