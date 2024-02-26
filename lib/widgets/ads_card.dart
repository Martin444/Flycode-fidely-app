import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flycode/utils/assets/routes/assets_routes.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/button_rounded.dart';
import 'package:flycode/widgets/card_glass.dart';

class AdCard extends StatefulWidget {
  final String title;
  final String description;
  final String pathUrl;
  final Function onClick;
  const AdCard({
    super.key,
    required this.title,
    required this.description,
    required this.pathUrl,
    required this.onClick,
  });

  @override
  State<AdCard> createState() => _AdCardState();
}

class _AdCardState extends State<AdCard> {
  @override
  Widget build(BuildContext context) {
    return CardBlured(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: FlTextStyle.title4,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.description,
                        style: FlTextStyle.description2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ButtonRounded(
                          title: 'Crear',
                          onPressed: () {
                            widget.onClick();
                          },
                          load: false,
                        ),
                      ),
                      const Flexible(
                        flex: 1,
                        child: SizedBox(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SvgPicture.asset(
              FlAssetsIcons.onBoard1,
              height: 130,
            ),
          ),
        ],
      ),
    );
  }
}
