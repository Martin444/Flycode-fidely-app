import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/data/usescases/register_client_usescase.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/auth/model/user_success_model.dart';
import 'package:flycode/fetures/client/presentation/handle/create_client_error.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:get/get.dart';

class NewClientController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool disableForm = false.obs;

  Future<UserSuccess?> registerClientCommerce() async {
    try {
      isLoading.value = true;
      update();
      var newClient = await RegisterClientUseCase().execute(
        User(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          photoURL: FlAssetsImages.catito,
          role: 'client',
        ),
      );

      isLoading.value = false;
      update();
      Get.toNamed(FlRoutes.REGISTER_SUCCESS);
      return newClient;
    } catch (e) {
      isLoading.value = false;

      update();
      HandleCreateClient(e);
    }
    return null;
  }
}
