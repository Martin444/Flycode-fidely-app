import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';

import '../../utils/assets/routes/assets_routes.dart';
import '../../utils/styles_fonts/fonts_styles.dart';
import '../card_glass.dart';
import '../tab_widget.dart';

class ProfileHeader extends StatelessWidget {
  final User user;
  const ProfileHeader({
    super.key,
    required this.user,
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
                          user.name!,
                          style: FlTextStyle.title5,
                        ),
                        Text(
                          'Desde ${user.createAt!.year}',
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
