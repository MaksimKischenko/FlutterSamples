import 'package:flutter/material.dart';
import 'package:stream_app/models/user_model.dart';
import 'package:stream_app/data/repositories/user_repository.dart';


class UserViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  var _users = <User>[];
  List<User> get users => _users;
  
  UserViewModel({
    required this.userRepository,
  });

  List<User> loadUsers() {
    _users = userRepository.getUsers();
    notifyListeners();
    return _users;
  }

  void addUser(User user) {
    userRepository.addUser(user);
    loadUsers();
    notifyListeners();
  }


  void deleteUser(User user) {
    userRepository.deleteUser(user);
    loadUsers();
    notifyListeners();
  }
}
