import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stream_app/models/user_model.dart';
import 'package:stream_app/view_models/user_view_model.dart';
import 'package:stream_app/views/user_view/widgets/users_list.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  UserViewModel? userViewModel;
  List<User>? users;
  User user = User(age: 19, name: 'Vald');

  @override
  void initState() {
    super.initState();
    //loadData();
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      users = loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    //userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('USERS LIST'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,        
      ),
      body: Consumer<UserViewModel>(
        builder: (context, value, child) {
          return UsersList(users: value.users);
        },
      ),
      // body: UsersList(
      //   users: users ?? []
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: addUser,
            tooltip: 'Add User',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: removeUser,
            tooltip: 'Remove User',
            child: const Icon(Icons.remove),
          ),            
        ],
      ), 
    );
  }

  void addUser() {
    Provider.of<UserViewModel>(context, listen: false).addUser(user);
    // userViewModel?.addUser(user);
    // users = loadData();
  }

  void removeUser() {
    Provider.of<UserViewModel>(context, listen: false).deleteUser(user);
    // userViewModel?.deleteUser(user);
    // users = loadData();
  }

  List<User>? loadData() {
    log('LOAD');
    Provider.of<UserViewModel>(context, listen: false).loadUsers();
    return null;
    // if(mounted && userViewModel != null) {
    //  return userViewModel?.loadUsers();
    // }
    // return null;
  }
}