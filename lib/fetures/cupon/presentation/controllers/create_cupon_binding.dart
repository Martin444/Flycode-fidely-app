import 'package:flycode/fetures/cupon/presentation/controllers/create_cupon_controller.dart';
import 'package:get/get.dart';

class CreateCuponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateCuponController());
  }
}
