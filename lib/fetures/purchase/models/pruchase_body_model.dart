class PurchaseBodyModel {
  final String clientId;
  final String description;
  final int amount;
  const PurchaseBodyModel({
    required this.clientId,
    required this.description,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return {
      'clientId': clientId,
      'description': description,
      'amount': amount,
    };
  }
}
