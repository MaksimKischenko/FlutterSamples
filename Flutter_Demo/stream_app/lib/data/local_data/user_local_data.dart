import 'dart:math';

import 'package:stream_app/models/user_model.dart';

class UserLocalData {
  static final List<User> usersData = List<User>.generate(54, (index) => User(age: Random().nextInt(89), name: getRandomString(6)));
}

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();