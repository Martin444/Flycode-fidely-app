class PurchaseModel {
  final String id;
  final String ownerCommerceId;
  final String clientId;
  final String description;
  final int amount;
  final DateTime? createAt;
  final DateTime? updateAt;

  const PurchaseModel({
    required this.id,
    required this.ownerCommerceId,
    required this.clientId,
    required this.description,
    required this.amount,
    this.createAt,
    this.updateAt,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      id: json['id'] as String,
      ownerCommerceId: json['ownerCommerce'] as String,
      clientId: json['clientId'] as String,
      description: json['description'] as String,
      amount: json['amount'].runtimeType == String
          ? int.tryParse(json['amount'])
          : json['amount'],
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(
              json['createAt']), // Evita llamar a DateTime.parse si es nulo
      updateAt:
          json['updateAt'] == null ? null : DateTime.parse(json['updateAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerCommerceId': ownerCommerceId,
      'clientId': clientId,
      'description': description,
      'amount': amount,
    };
  }
}
