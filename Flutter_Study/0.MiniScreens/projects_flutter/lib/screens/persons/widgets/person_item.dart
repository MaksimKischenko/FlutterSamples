import 'package:flutter/material.dart';
import 'package:untitled1/models/person.dart';

class PersonItem extends StatelessWidget {
  final Person person;
  final Function(Person person) onTap;

  PersonItem({required this.person, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(person),
      title: Text(
        "${person.id} ${person.firstName} ${person.lastName}",
      ),
      subtitle: Hero(
          tag: 'person ${person.id}', child: Image.network(person.avatar!)),
    );
  }
}
