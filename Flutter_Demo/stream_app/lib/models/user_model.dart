// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

base class User {
  final int age;
  final String name;
  
  User({
    required this.age,
    required this.name,
  });

  User copyWith({
    int? age,
    String? name,
  }) {
    return User(
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'age': age,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      age: map['age'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(age: $age, name: $name)';
}
