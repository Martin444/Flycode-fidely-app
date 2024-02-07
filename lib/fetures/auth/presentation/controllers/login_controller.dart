import 'package:flutter/material.dart';
import 'package:flycode/core/config.dart';
import 'package:flycode/core/exceptions/api_exception.dart';
import 'package:flycode/fetures/auth/data/usescases/login_usescase.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/funcions/validators.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString errorTextEmail = ''.obs;
  RxString errorTextPassword = ''.obs;

  RxBool isLogging = false.obs;
  RxBool isValidInit = false.obs;

  Future<void> loginWithEmailandPassword() async {
    try {
      isLogging.value = true;
      update();
      var userLogin = User(
        email: emailController.text,
        password: passwordController.text,
      );
      var responseLogin = await LoginUserUseCase().execute(userLogin);
      ACCESS_TOKEN = responseLogin.accessToken;
      isLogging.value = false;
      if (responseLogin.needCommerce) {
        Get.toNamed(FlRoutes.REGISTER_WORK);
      } else {
        Get.toNamed(FlRoutes.HOME);
      }

      update();
    } on ApiException catch (e) {
      isLogging.value = false;
      if (e.statusCode == 401) {
        errorTextPassword.value = e.message;
        errorTextPassword.refresh();
      } else {
        errorTextEmail.value = e.message;
        errorTextEmail.refresh();
      }
      update();
    }
  }

  RxBool validateBtnLoginUser() {
    var isEmail = validateEmail(emailController.text);
    if (!isEmail && emailController.text.length >= 4) {
      errorTextEmail.value = 'Ingresa un email válido';
    } else {
      errorTextEmail.value = '';
    }

    var validateItems =
        (emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
            .obs;

    isValidInit = validateItems;
    update();
    return validateItems;
  }
}
