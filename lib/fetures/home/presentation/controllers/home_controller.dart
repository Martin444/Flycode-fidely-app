import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt indexHomePage = 0.obs;
  PageController contolerHomePageView = PageController();

  void setIndexPageHome(int index) {
    // contolerHomePageView.jumpToPage(index);
    contolerHomePageView.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    // contolerHomePageView.nextPage(
    //     duration: Duration(milliseconds: 2222), curve: Curves.bounceIn);
  }
}
