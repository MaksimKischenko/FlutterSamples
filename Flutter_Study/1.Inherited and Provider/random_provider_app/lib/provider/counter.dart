import 'package:anitex/anitex.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter(this.counter, {Key? key }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) => AnimatedText(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
  );
}