import 'package:flutter/material.dart';
import 'package:flycode/widgets/ads_card.dart';

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
      child: const Column(
        children: [
          AdCard(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
