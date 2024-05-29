import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled1/models/user.dart';

class UserService {
  static Future<List<User>> fetchUsers(http.Client client, int id) async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users?id=$id"));
    return parseUserData(response.body);
  }

  static List<User> parseUserData(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
