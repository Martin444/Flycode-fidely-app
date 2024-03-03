import 'package:flutter/material.dart';
import 'package:flycode/utils/formaters/DateTime/date_to_finshed.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/card_glass.dart';

class DiscountCard extends StatelessWidget {
  final String title;
  final DateTime? description;
  final String imageUrl;

  const DiscountCard({
    super.key,
    required this.title,
    this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            children: [
              CardBlured(
                child: Column(
                  children: [
                    // imagen del producto
                    Expanded(
                        flex: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            imageUrl,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        )),

                    //informacion adicional
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              textAlign: TextAlign.start,
                              style: FlTextStyle.title6,
                            ),
                            if (description != null) ...[
                              const SizedBox(height: 8),
                              Text(
                                description!.tiempoRestante(description!),
                                textAlign: TextAlign.start,
                                style: FlTextStyle.description2,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //seccion de descuento
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                    ),
                  ),
                  child: const Text(
                    '20% OFF',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
