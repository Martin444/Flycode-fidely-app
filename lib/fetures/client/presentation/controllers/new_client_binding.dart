import 'package:flycode/fetures/client/presentation/controllers/new_client_controller.dart';
import 'package:get/get.dart';

class NewClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewClientController());
  }
}
