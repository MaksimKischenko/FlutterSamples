

import 'package:rxdart/subjects.dart';
import 'package:stream_app/models/user_model.dart';

abstract  interface class IUserRepository {
  void addUser(User user); 

  void deleteUser(User user); 

  List<User> getUsers(); 
}

base class UserRepository implements IUserRepository {
  final List<User> users;
  BehaviorSubject<List<User>> elementStreamController;

  UserRepository({
    required this.users,
  }) : elementStreamController = BehaviorSubject<List<User>>.seeded(users);


  @override
  void addUser(User user) {
    users.insert(0, user);
    elementStreamController.add(users);
  }

  @override
  void deleteUser(User user) {
    users.remove(user);
    elementStreamController.add(users);
  }

  @override
  List<User> getUsers() {
    return elementStreamController.value;
  }
}
