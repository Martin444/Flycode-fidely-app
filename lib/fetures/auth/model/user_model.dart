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
      id: json['id'] ?? '',
      name: json['name'] ??
          'Sin nombre', // Asigna un valor por defecto si es nulo
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? '',
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(
              json['createAt']), // Evita llamar a DateTime.parse si es nulo
      updateAt:
          json['updateAt'] == null ? null : DateTime.parse(json['updateAt']),
      photoURL: json['photoURL'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
