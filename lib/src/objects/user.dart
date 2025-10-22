class User {
  late dynamic id;
  late dynamic username;
  User(
      {this.id,
        this.username,});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['id'].toString(),
      username: parsedJson['username'].toString(),
    );
  }
}
