import 'package:flutter/material.dart';
import 'package:flycode/widgets/ads_card.dart';
import 'package:flycode/widgets/user_tile.dart';

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
          UserTile(),
          SizedBox(
            height: 10,
          ),
          UserTile(),
          SizedBox(
            height: 10,
          ),
          UserTile(),
          SizedBox(
            height: 10,
          ),
          UserTile(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
