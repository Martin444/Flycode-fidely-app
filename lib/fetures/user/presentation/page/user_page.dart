import 'package:flutter/material.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/routes/routes.dart';
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
    print(Get.currentRoute);
    print(Get.arguments);
    userContro.getUserInfo(Get.arguments ?? Get.currentRoute.split('/').last);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: Stack(
        children: [
          const BackgroundCircles(),
          Container(
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
                const ProfileHeader(),
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
      ),
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

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(-0.9, -1.5),
      children: [
        CardBlured(
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 90,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ALan brito',
                          style: FlTextStyle.title5,
                        ),
                        Text(
                          'Desde 22/22/2922',
                          style: FlTextStyle.description2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TabsWidget(
                titles: const ['Compras', 'Cupones'],
                onChange: (index) => null,
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            FlAssetsImages.catito,
          ),
        ),
      ],
    );
  }
}
