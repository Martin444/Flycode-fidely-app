import 'package:flutter/material.dart';
import 'package:flycode/fetures/home/presentation/controllers/home_controller.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/ads_card.dart';
import 'package:flycode/widgets/user_tile.dart';
import 'package:get/get.dart';

class ClientView extends StatelessWidget {
  const ClientView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: const Column(
        children: [
          AdCard(),
          SizedBox(
            height: 20,
          ),
          ClientList(),
        ],
      ),
    );
  }
}

class ClientList extends StatefulWidget {
  const ClientList({
    super.key,
  });

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final homeControl = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeControl.getClientsByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeControl.messageClient.isEmpty) {
        return Expanded(
            child: ListView.builder(
          itemCount: homeControl.listUserResponse.length,
          itemBuilder: (context, index) {
            final user = homeControl.listUserResponse[index];
            return UserTile(
              user: user,
              // Otros detalles del usuario aquí
            );
          },
        ));
      } else {
        return Center(
          child: Text(
            homeControl.messageClient.value,
            style: FlTextStyle.title4,
          ),
        );
      }
    });
  }
}
