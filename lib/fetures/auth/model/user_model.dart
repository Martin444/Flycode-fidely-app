class User {
  String? id;
  String? photoURL;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? role;
  DateTime? createAt;
  DateTime? updateAt;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.role,
    this.createAt,
    this.updateAt,
    this.photoURL,
  });

  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['password'],
      role: json['role'],
      createAt: DateTime.parse(json['createAt']),
      updateAt: DateTime.parse(json['updateAt']),
      photoURL: json['photoURL'],
      password: json['password'],
    );
  }
}
