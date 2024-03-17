import 'package:flutter/material.dart';
import 'package:flycode/fetures/purchase/presentation/controllers/purchase_controller.dart';
import 'package:flycode/fetures/purchase/presentation/views/purchases_list.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/formaters/DateTime/date_to_finshed.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:flycode/widgets/buttons/button_icon.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:flycode/widgets/logo_section.dart';
import 'package:flycode/widgets/users/profile_header.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var userContro = Get.find<UserController>();
  var purchaseContro = Get.find<PurchaseController>();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      userContro.getUserInfo(Get.arguments ?? Get.currentRoute.split('/').last);
      purchaseContro.getPurchasesByClientID(
        Get.arguments ?? Get.currentRoute.split('/').last,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    userContro.disposeUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: GetBuilder<UserController>(
        builder: (_) {
          return Stack(
            children: [
              const BackgroundCircles(),
              _.isLoadingProfile.value && _.selectedUser == null
                  ? Center(
                      child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(FlColors.withe2),
                    ))
                  : Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LogoSection(
                            titleBar: 'Perfil del cliente',
                            routeBack: FlRoutes.HOME,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ProfileHeader(
                            user: _.selectedUser!,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonIconText(
                            onPressed: () {
                              Get.toNamed(
                                FlRoutes.REGISTER_PURCHACE,
                                arguments: _.selectedUser!.id,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<PurchaseController>(
                            builder: (_) {
                              return PurchaseList(
                                pruchases: _.purchaseByClienTSelected,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class PurchaseTile extends StatelessWidget {
  final String title;
  final String amount;
  final DateTime created;

  const PurchaseTile({
    super.key,
    required this.title,
    required this.amount,
    required this.created,
  });

  @override
  Widget build(BuildContext context) {
    return CardBlured(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: FlTextStyle.textInput1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                created.timePassed(),
                style: FlTextStyle.description2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                amount,
                textAlign: TextAlign.end,
                style: FlTextStyle.textInput1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
