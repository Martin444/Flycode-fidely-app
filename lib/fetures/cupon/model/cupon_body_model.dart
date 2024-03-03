// Un modelo para representar un cupón de descuento
class CouponBodyModel {
  // Los atributos del cupón
  late String photoURL;
  late String title;
  late String description;
  late String type;
  int? percentage;
  int? amount;
  DateTime? expiryDate;
  int? minPurchaseAmount;
  int? maxUsageCount;
  List<String?>? applicableProducts;
  List<String?>? eligibleUsers;

  // El constructor del cupón
  CouponBodyModel({
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
  Object toMap() {
    return {
      'photoURL': photoURL,
      'title': title,
      'description': description,
      'type': type,
      'percentage': percentage,
      'amount': amount,
      'expiryDate': expiryDate!.toUtc().toIso8601String(),
      'minPurchaseAmount': minPurchaseAmount,
      'maxUsageCount': maxUsageCount,
      'applicableProducts': applicableProducts,
      'eligibleUsers': eligibleUsers,
    };
  }

  // Un método para convertir un mapa a un cupón
  CouponBodyModel.fromMap(Map<String, dynamic> map) {
    photoURL = map['photoURL'];
    title = map['title'];
    description = map['description'];
    type = map['type'];
    percentage = map['percentage'];
    amount = map['amount'];
    expiryDate = DateTime.parse(map['expiryDate']);
    minPurchaseAmount = map['minPurchaseAmount'];
    maxUsageCount = map['maxUsageCount'];
    applicableProducts = List<String>.from(map['applicableProducts']);
    eligibleUsers = List<String>.from(map['eligibleUsers']);
  }
}
