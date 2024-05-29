import 'package:flutter/material.dart';

class ArrivedMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8),
          ]),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text('Your taxi has arrived',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
