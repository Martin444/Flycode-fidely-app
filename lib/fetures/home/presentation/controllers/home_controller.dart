import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/home/data/usescases/get_clients_usescases.dart';
import 'package:flycode/fetures/home/presentation/handle/handle_client_dart.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexHomePage = 0.obs;
  PageController contolerHomePageView = PageController();

  void setIndexPageHome(int index) {
    contolerHomePageView.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  RxList<User> listUserResponse = <User>[].obs;
  RxString messageClient = ''.obs;

  void getClientsByUser() async {
    try {
      final listUsers = await GetClientsUseCase().execute();
      listUserResponse.value = listUsers.reversed.toList();
      listUserResponse.refresh();
    } catch (e) {
      var isEmpti = HandleClientData(e).isEmptyList();
      if (isEmpti) {
        messageClient.value = 'No tienes clientes';
      }
    }
  }
}
