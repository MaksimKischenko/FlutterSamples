import 'package:flutter/material.dart';

class GoingLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center, //Почему не это
        mainAxisSize: MainAxisSize.min, //!
        children: [
          Icon(
            Icons.circle,
            size: 15,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            height: 30,
            width: 0.5,
            color: Colors.black,
          ),
          //SizedBox(height: 30),
          Icon(Icons.arrow_downward, size: 15)
        ],
      ),
    );
  }
}
