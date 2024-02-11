import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/data/usescases/register_usescase.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:get/get.dart';

class NewClientController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool disableForm = false.obs;

  void registerClientCommerce() async {
    try {
      var newClient = await RegisterUserUseCase().execute(
        User(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          photoURL: FlAssetsImages.catito,
        ),
      );

      print(newClient);
    } catch (e) {}
  }
}
