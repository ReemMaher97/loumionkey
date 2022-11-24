class Users {
  late final int id;
  late final String name;
  late final String email;
  late final String password;
  late final String phoneNumber;


  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Users.fromMap(Map<String, dynamic> result)
      : id = result["id"],
        name = result["name"],
        email = result["email"],
        password = result["password"],
        phoneNumber = result["phoneNumber"];


  Map<String, Object> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber
    };
  }
}
