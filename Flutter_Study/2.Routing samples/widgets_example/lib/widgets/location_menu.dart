import 'package:flutter/material.dart';

import 'widgets.dart';


class LocationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            children: [LocationPointer()],
          ),
        ),
        Divider(),
        Row(),
        Row(),
      ],
    );
  }
}
