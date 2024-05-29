// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String name;
  final int age;

  const UserItem({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person_2_outlined),
      title: Text('Name: $name'),
      subtitle: Text('Age: $age'),
    );
  }
}
