
import 'package:flutter/material.dart';
import 'package:stream_app/models/user_model.dart';
import 'package:stream_app/views/user_view/widgets/user_item.dart';


class UsersList extends StatelessWidget {
  final List<User> users;

  const UsersList({
    Key? key,
    required this.users,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) => UserItem(
        name: users[index].name,
        age: users[index].age,
      ), 
      separatorBuilder: (context, index) => const SizedBox(height: 8), 
      itemCount: users.length
    );
  }
}
