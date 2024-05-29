import 'package:flutter/material.dart';

import 'package:untitled1/models/models.dart';

class PersonScreen extends StatelessWidget {
  final Person person;

  const PersonScreen({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.firstName} ${person.lastName}'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
              tag: 'person ${person.id}', child: Image.network(person.avatar!)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "${person.email}",
              style: TextStyle(
                  color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
