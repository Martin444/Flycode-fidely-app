import 'package:flycode/fetures/auth/presentation/controllers/login_controller.dart';
import 'package:flycode/fetures/auth/presentation/controllers/register_controller.dart';
import 'package:flycode/fetures/cupon/presentation/controllers/create_cupon_controller.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_controller.dart';
import 'package:flycode/fetures/client/presentation/controllers/new_client_controller.dart';
import 'package:flycode/fetures/on_boarding.dart/controllers/onborading_controller.dart';
import 'package:flycode/fetures/purchase/presentation/controllers/purchase_controller.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => OnboardingController(),
      fenix: true,
    );
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => RegisterController(),
      fenix: true,
    );
    Get.lazyPut(
      () => UserController(),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut(
      () => NewClientController(),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateCuponController(),
      fenix: true,
    );
    Get.lazyPut(
      () => PurchaseController(),
      fenix: true,
    );
  }
}
