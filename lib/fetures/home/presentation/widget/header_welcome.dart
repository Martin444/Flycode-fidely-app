import 'package:flutter/material.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_controller.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:flycode/widgets/tab_widget.dart';
import 'package:get/get.dart';

class HeaderWelcome extends StatefulWidget {
  final Function(int) onChangePage;

  const HeaderWelcome({
    super.key,
    required this.onChangePage,
  });

  @override
  State<HeaderWelcome> createState() => _HeaderWelcomeState();
}

class _HeaderWelcomeState extends State<HeaderWelcome> {
  var userC = Get.find<UserController>();
  var homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (_) {
      return CardBlured(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  _.getSaludo(),
                  style: FlTextStyle.title3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TabsWidget(
                titles: const ['Clientes', 'Cupones'],
                onChange: (index) => widget.onChangePage(index),
              ),
            ],
          ),
        ),
      );
    });
  }
}
