class Person {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  Person({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] == null ? null : json['id'],
      email: json['email'] == null ? null : json['email'],
      firstName: json['first_name'] == null ? null : json['first_name'],
      lastName: json['last_name'] == null ? "?????" : json['last_name'],
      avatar: json['avatar'] == null ? null : json['avatar'],
    );
  }
}

class PersonResponse {
  final int totalPages;
  final List<Person> persons;
  PersonResponse({
    required this.totalPages,
    required this.persons,
  });
}
