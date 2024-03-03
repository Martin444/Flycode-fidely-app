import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/anim/loader_widget.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/background_circles.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:flycode/widgets/carrousel.dart';
import 'package:flycode/widgets/custom_grid_view.dart';
import 'package:flycode/widgets/disscount.dart';
import 'package:flycode/widgets/logo_section.dart';
import 'package:flycode/widgets/tab_widget.dart';
import 'package:flycode/widgets/users/profile_header.dart';
import 'package:get/get.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  var userContro = Get.find<UserController>();

  @override
  void initState() {
    userContro.getUserInfo(Get.arguments ?? Get.currentRoute.split('/').last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: GetBuilder<UserController>(builder: (_) {
        return Stack(
          children: [
            const BackgroundCircles(),
            _.isLoadingUser
                ? CircularProgressIndicator()
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
                        const ButtonIconText(),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: CustomGridView(
                            widgets: [
                              DiscountCard(
                                title: 'Producto',
                                imageUrl: FlAssetsImages.catito,
                              ),
                              DiscountCard(
                                title: 'Producto 1',
                                imageUrl: FlAssetsImages.catito,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        );
      }),
    );
  }
}

class PurchaseTile extends StatelessWidget {
  const PurchaseTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardBlured(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Articulo de mi tienda',
            style: FlTextStyle.textInput1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hace 2h',
                style: FlTextStyle.description2,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                r'$3232',
                style: FlTextStyle.textInput1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonIconText extends StatelessWidget {
  const ButtonIconText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.playlist_add_rounded,
            color: FlColors.withe2,
            fill: 0.3,
          ),
          Text(
            'Registrar compra',
            style: FlTextStyle.secundaryButtonStyle,
          ),
        ],
      ),
    );
  }
}
