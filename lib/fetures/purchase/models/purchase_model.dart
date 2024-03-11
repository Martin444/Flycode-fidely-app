class PurchaseModel {
  final String id;
  final String ownerCommerceId;
  final String clientId;
  final String description;
  final int amount;

  const PurchaseModel({
    required this.id,
    required this.ownerCommerceId,
    required this.clientId,
    required this.description,
    required this.amount,
  });

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      id: json['id'] as String,
      ownerCommerceId: json['ownerCommerceId'] as String,
      clientId: json['clientId'] as String,
      description: json['description'] as String,
      amount: json['amount'] as int,
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
