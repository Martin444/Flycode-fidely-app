import 'package:flutter/material.dart';
import 'package:flycode/fetures/auth/model/user_model.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:get/get.dart';

class UserTile extends StatefulWidget {
  final User user;
  const UserTile({super.key, required this.user});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(
              FlRoutes.USER_PROFILE.replaceAll(
                ':idUsuario',
                widget.user.id!,
              ),
              arguments: widget.user.id,
            );
          },
          child: CardBlured(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoURL!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name!,
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
                        child: Text(
                          'Editar',
                          style: FlTextStyle.description2,
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Text(
                          'Eliminar',
                          style: FlTextStyle.description2,
                        ),
                      ),
                      PopupMenuItem(
                        value: 3,
                        child: Text(
                          'Reportar',
                          style: FlTextStyle.description2,
                        ),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    color: FlColors.withe2.withOpacity(0.2),
                    onSelected: (value) {
                      // Lógica para manejar la opción seleccionada
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
