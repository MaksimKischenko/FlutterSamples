import 'package:flutter/material.dart';

class ListTileTester extends StatelessWidget {
  const ListTileTester({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final listTile = ListTile.divideTiles(
      context: context,
      tiles: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Container(
          height: 50,
          width: 50,
          color: Colors.green,
        )
      ],
      color: Colors.red
    ).toList();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listTile,
        )
      ),
    );
  }
}