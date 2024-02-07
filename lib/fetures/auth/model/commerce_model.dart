class Commerce {
  String? id;
  String? photoURL;
  String? email;
  bool? emailValidate;
  String? description;
  String? categoryId;
  String? name;
  String? web;
  String? validateFile;
  String? phone;
  String? businessType;
  DateTime? dateExpiration;

  Commerce({
    this.id,
    this.photoURL,
    this.email,
    this.emailValidate,
    this.description,
    this.categoryId,
    this.name,
    this.web,
    this.validateFile,
    this.phone,
    this.businessType,
    this.dateExpiration,
  });

  factory Commerce.fromJson(Map<String, dynamic> json) {
    return Commerce(
      id: json['id'],
      photoURL: json['photoURL'],
      email: json['email'],
      emailValidate: json['emailValidate'],
      description: json['description'],
      categoryId: json['categoryId'],
      name: json['name'],
      web: json['web'],
      validateFile: json['validateFile'],
      phone: json['phone'],
      businessType: json['businessType'],
      dateExpiration: DateTime.parse(json['dateExpiration']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id ?? '',
        'photoURL': photoURL ?? '',
        'email': email ?? '',
        'emailValidate': emailValidate?.toString() ?? '',
        'description': description ?? '',
        'categoryId': categoryId ?? '',
        'name': name ?? '',
        'web': web ?? '',
        'validateFile': validateFile ?? '',
        'phone': phone ?? '',
        'businessType': businessType ?? '',
        'dateExpiration': dateExpiration?.toIso8601String(),
      };
}
