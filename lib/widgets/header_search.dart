import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flycode/fetures/user/presentation/controllers/user_controller.dart';
import 'package:flycode/utils/anim/delayed_reveal.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:get/get.dart';

class HeaderSearch extends StatefulWidget {
  const HeaderSearch({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderSearch> createState() => _HeaderSearchState();
}

class _HeaderSearchState extends State<HeaderSearch> {
  var userC = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return DelayedReveal(
      delay: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlColors.withe2.withOpacity(0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SvgPicture.asset(
                FlAssetsIcons.menuSvg,
                // height: 14,
                // ignore: deprecated_member_use
                color: FlColors.withe2,
              ),
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SvgPicture.asset(
                    FlAssetsIcons.giftSvg,
                    height: 25,
                  ),
                ),
              ),
              // userC.principalUser != null
              //     ? GestureDetector(
              //         onTap: () {},
              //         child: Container(
              //           padding: const EdgeInsets.only(left: 10),
              //           child: Image.network(userC.principalUser!.photoURL!),
              //         ),
              //       )
              //     :
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: SvgPicture.asset(
                    FlAssetsIcons.avatarSvg,
                    height: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
