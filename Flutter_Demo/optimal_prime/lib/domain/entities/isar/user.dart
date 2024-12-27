import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  Id id = Isar.autoIncrement;
  int level = 1;
  int points = 0;
  DateTime? firstLogin;
  DateTime? lastLogin;
}
