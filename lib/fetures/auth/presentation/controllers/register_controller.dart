import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flycode/core/config.dart';
import 'package:flycode/fetures/auth/data/usescases/register_usescase.dart';
import 'package:flycode/fetures/auth/data/usescases/register_work_usescase.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/funcions/validators.dart';
import 'package:get/get.dart';

import '../../model/commerce_model.dart';

class RegisterController extends GetxController {
  bool isLoadRegister = false;

  void sendDataRegister() async {
    try {
      isLoadRegister = true;
      var newUser = User(
        photoURL: '',
        name: nameController.text,
        email: emailController.text,
        phone: '',
        password: passwordController.text,
        role: 'consumer',
      );
      await registerUserWithEmailAndPassword(newUser);
      isLoadRegister = false;
      Get.toNamed(FlRoutes.REGISTER_WORK);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> registerUserWithEmailAndPassword(User user) async {
    try {
      var response = await RegisterUserUseCase().execute(user);
      var responseJson = jsonDecode(response);
      ACCESS_TOKEN = responseJson['access_token'];
      return response;
    } catch (e) {
      rethrow;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();

  bool validateFormRegisterUser() {
    update();
    var isValidEmail = validateCorrectEmail(emailController.text);
    var samePass = samePassword();

    return isValidEmail &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        samePass;
  }

  String? errorTextEmail;
  String? errorTextPassword;

  bool validateCorrectEmail(String email) {
    bool isEmail = validateEmail(email) || email.isEmpty;
    if (isEmail) {
      errorTextEmail = null;
      update();
      return isEmail;
    } else {
      errorTextEmail = 'Escribe un email valido';
      update();
      return isEmail;
    }
  }

  bool samePassword() {
    if (passwordController.text.isEmpty &&
        passwordRetryController.text.isEmpty) {
      return false;
    }

    if (passwordController.text != passwordRetryController.text &&
        passwordRetryController.text.length > 3) {
      errorTextPassword = 'Escribe la misma contraseña';
      update();
      return passwordController.text == passwordRetryController.text;
    } else {}
    update();
    errorTextPassword = null;
    return passwordController.text == passwordRetryController.text;
  }

  // Register work

  String typeCommerce = '';

  TextEditingController nameComerceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void setTypeCommerce(String value) {
    typeCommerce = value;
  }

  bool isValidFormWork = false;
  bool isLoadingWork = false;
  bool validateFormWorkRegister() {
    isValidFormWork = (typeCommerce.isNotEmpty &&
        nameComerceController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty);
    update();
    return isValidFormWork;
  }

  Future<void> registerWorkApi() async {
    isLoadingWork = true;
    update();
    var commerce = Commerce(
      id: '',
      photoURL:
          'http://res.cloudinary.com/photographer/image/upload/v1698582410/scublm1dh1gpakjohaop.jpg',
      email: addressController.text,
      emailValidate: false,
      description: descriptionController.text,
      categoryId: '',
      name: nameComerceController.text,
      web: '',
      validateFile: '',
      phone: '',
      businessType: typeCommerce,
      dateExpiration: DateTime.parse('2023-12-28T17:22:57.981Z'),
    );
    var response = await RegisterWorkUseCase().execute(commerce);

    if (response.id!.isNotEmpty) {
      isLoadingWork = false;
      Get.toNamed(FlRoutes.HOME);
    }
  }
}
