import 'package:flycode/fetures/purchase/presentation/controllers/purchase_controller.dart';
import 'package:get/get.dart';

class PurchaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PurchaseController());
  }
}
