import 'package:flutter/material.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/widgets/ads_card.dart';
import 'package:get/get.dart';

import '../../../../utils/assets/routes/assets_routes.dart';

class CouponView extends StatelessWidget {
  const CouponView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
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
        ],
      ),
    );
  }
}
