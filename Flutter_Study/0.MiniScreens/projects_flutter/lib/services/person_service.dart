import 'package:http/http.dart' as http;
import 'package:untitled1/blocs/blocs.dart';
import 'dart:convert';
import 'package:untitled1/models/person.dart';

class PersonService {
  static Future<PersonResponse> fetchPersons(
      {required http.Client client, int page = 1}) async {
    final response = await client.get(Uri.parse(
        "https://reqres.in/api/users?page=$page&per_page=${PersonBloc.loadCount}"));
    final parsed = json.decode(response.body) as Map<String, dynamic>;
    return PersonResponse(
        totalPages: parsed['total_pages'], persons: parsePersonsPhotos(parsed));
  }

  static List<Person> parsePersonsPhotos(Map<String, dynamic> parsed) {
    return parsed['data'].map<Person>((json) => Person.fromJson(json)).toList();
  }
}
