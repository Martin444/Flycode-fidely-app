import 'package:flutter/material.dart';
import 'package:flycode/fetures/user/presentation/page/user_page.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:get/get.dart';

class UserTile extends StatefulWidget {
  const UserTile({super.key});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const UserPage());
      },
      child: CardBlured(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: FlColors.circle1purple,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alan Brito',
                      style: FlTextStyle.title5,
                    ),
                    Text(
                      '5 compras realizadas',
                      style: FlTextStyle.description2,
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              flex: 0,
              child: PopupMenuButton(
                shadowColor: FlColors.blueSelector,
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Container(
                      child: Text(
                        'Editar',
                        style: FlTextStyle.description2,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Container(
                      child: Text(
                        'Eliminar',
                        style: FlTextStyle.description2,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Container(
                      child: Text(
                        'Reportar',
                        style: FlTextStyle.description2,
                      ),
                    ),
                  ),
                ],
                icon: Icon(Icons.more_vert, color: Colors.white),
                color: FlColors.withe2.withOpacity(0.2),
                onSelected: (value) {
                  // Lógica para manejar la opción seleccionada
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
