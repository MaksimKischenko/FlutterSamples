class User {
  final int id;
  final String userName;
  final String email;

  User({
    required this.id,
    required this.userName,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      userName: json['username'] as String,
      email: json['email'] as String,
    );
  }
}
