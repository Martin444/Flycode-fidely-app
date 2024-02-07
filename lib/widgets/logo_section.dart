import 'package:flutter/material.dart';
import 'package:flycode/routes/routes.dart';
import 'package:flycode/widgets/secondary_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoSection extends StatelessWidget {
  final bool? withOmit;

  const LogoSection({
    super.key,
    this.withOmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.account_tree_rounded,
              color: Colors.white,
              size: 30,
            ),
            Text(
              'Fidely',
              style: GoogleFonts.sofia(
                color: Colors.white,
                fontSize: 34,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        Visibility(
          visible: withOmit ?? false,
          child: SecondaryButton(
            title: "Omitir",
            onPressed: () {
              Get.toNamed(FlRoutes.REGISTER_USER);
            },
          ),
        )
      ],
    );
  }
}
