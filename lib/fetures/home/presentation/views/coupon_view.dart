import 'package:flutter/material.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/widgets/ads_card.dart';
import 'package:flycode/widgets/custom_grid_view.dart';
import 'package:flycode/widgets/disscount.dart';
import 'package:get/get.dart';

import '../../../../utils/assets/routes/assets_routes.dart';
import '../controllers/home_controller.dart';

class CouponView extends StatefulWidget {
  const CouponView({
    super.key,
  });

  @override
  State<CouponView> createState() => _CouponViewState();
}

class _CouponViewState extends State<CouponView> {
  final homeControl = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          AdCard(
            title: '¿Querés vender más?',
            description:
                'Aprende a gestionar tus cupones y nosotros te ayudamos con los datos.',
            pathUrl: FlAssetsIcons.onBoard1,
            onClick: () {
              Get.toNamed(FlRoutes.CREATE_CUPON);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return CustomGridView(
              // ignore: invalid_use_of_protected_member
              widgets: homeControl.listCuponsWisgetsHome.value,
            );
          })
        ],
      ),
    );
  }
}
