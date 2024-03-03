// Un modelo para representar un cupón de descuento
class Coupon {
  // Los atributos del cupón
  late String id;
  late String ownerCommerce;
  late String photoURL;
  late String title;
  late String description;
  late String type;
  int? percentage;
  int? amount;
  DateTime? expiryDate;
  int? minPurchaseAmount;
  int? maxUsageCount;
  List<String>? applicableProducts;
  List<String>? eligibleUsers;

  // El constructor del cupón
  Coupon({
    required this.id,
    required this.ownerCommerce,
    required this.photoURL,
    required this.title,
    required this.description,
    required this.type,
    this.percentage,
    this.amount,
    this.expiryDate,
    this.minPurchaseAmount,
    this.maxUsageCount,
    this.applicableProducts,
    this.eligibleUsers,
  });

  // Un método para convertir el cupón a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerCommerce': ownerCommerce,
      'photoURL': photoURL,
      'title': title,
      'description': description,
      'type': type,
      'percentage': percentage,
      'amount': amount,
      'expiry_date': expiryDate!,
      'minPurchaseAmount': minPurchaseAmount,
      'maxUsageCount': maxUsageCount,
      'applicableProducts': applicableProducts,
      'eligibleUsers': eligibleUsers,
    };
  }

  // Un método para convertir un mapa a un cupón
  Coupon.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    ownerCommerce = map["ownerCommerceID"] ?? '';
    photoURL = map['photoURL'];
    title = map['title'];
    description = map['description'];
    type = map['type'];
    percentage = map['percentage'];
    amount = map['amount'];
    expiryDate = DateTime.parse(map["expiryDate"]);
    minPurchaseAmount = map['minPurchaseAmount'];
    maxUsageCount = map['maxUsageCount'];
    applicableProducts = List<String>.from(map['applicableProducts']);
    eligibleUsers = List<String>.from(map['eligibleUsers']);
  }
}
