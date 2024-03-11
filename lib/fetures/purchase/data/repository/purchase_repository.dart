import 'package:flycode/fetures/purchase/models/pruchase_body_model.dart';

import '../../models/purchase_model.dart';

abstract class PurchaseRepository {
  Future<PurchaseModel> postNewPurchasebyClient(PurchaseBodyModel pruchase);
}
