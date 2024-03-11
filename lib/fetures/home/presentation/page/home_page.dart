import 'package:flutter/material.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_controller.dart';
import 'package:flycode/fetures/home/presentation/views/clients_view.dart';
import 'package:flycode/fetures/home/presentation/views/coupon_view.dart';
import 'package:flycode/fetures/home/presentation/widget/drawer_menu.dart';
import 'package:flycode/fetures/home/presentation/widget/header_welcome.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:flycode/widgets/header_search.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userController = Get.find<UserController>();
  var homeController = Get.find<HomeController>();
  PageController contolerHomePageView = PageController();

  void setIndexPageHome(int index) {
    try {
      contolerHomePageView.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      contolerHomePageView = PageController(
        initialPage: index,
        viewportFraction: 1.0,
      );
    }
  }

  @override
  void initState() {
    userController.getMeInfo();
    contolerHomePageView = PageController(
      initialPage: 0,
      viewportFraction: 1.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (_) {
        if (_.isLoadingUser) {
          return Scaffold(
            backgroundColor: FlColors.primaryColorsBackground,
            body: const Stack(
              alignment: Alignment.center,
              children: [
                BackgroundCircles(),
                CircularProgressIndicator(),
              ],
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: FlColors.primaryColorsBackground,
            drawer: const DrawMenu(),
            body: SafeArea(
              child: Stack(
                children: [
                  const BackgroundCircles(),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 20,
                        ),
                        child: Column(
                          children: [
                            const HeaderSearch(),
                            const SizedBox(
                              height: 20,
                            ),
                            HeaderWelcome(
                              onChangePage: (index) {
                                setIndexPageHome(index);
                              },
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: PageView.builder(
                          itemCount: 2,
                          controller: contolerHomePageView,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (cnt, index) {
                            switch (index) {
                              case 0:
                                return const ClientView();

                              case 1:
                                return const CouponView();

                              default:
                                return const ClientView();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
