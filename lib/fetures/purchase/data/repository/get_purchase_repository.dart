import 'package:flycode/fetures/purchase/models/purchase_model.dart';

abstract class GetPurchasesRepository {
  Future<List<PurchaseModel>> getPurchasesByClientID(String clientId);
}
