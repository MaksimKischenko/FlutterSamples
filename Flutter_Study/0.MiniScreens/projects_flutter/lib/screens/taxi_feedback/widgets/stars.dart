import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final int? value;
  final Function(int? value) onTap;

  const Stars({Key? key, required this.value, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          5,
          (index) => GestureDetector(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Icon(
                    Icons.star,
                    color: index <= (value ?? -1) ? Colors.blue : Colors.grey,
                    size: 36,
                  )),
              onTap: () => onTap(index == value ? null : index))),
    );
  }
}
