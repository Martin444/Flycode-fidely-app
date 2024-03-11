import 'package:flutter/material.dart';
import 'package:flycode/fetures/cupon/model/cupon_model.dart';
import 'package:flycode/utils/formaters/DateTime/date_to_finshed.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';
import 'package:flycode/widgets/card_glass.dart';
import 'package:flycode/widgets/overflow_text.dart';

class DiscountCard extends StatelessWidget {
  final Coupon cupon;

  const DiscountCard({
    super.key,
    required this.cupon,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          cupon.photoURL,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),

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
                            OpOverflowTextDetector(
                              message: cupon.title,
                              children: [
                                Text(
                                  cupon.title,
                                  textAlign: TextAlign.start,
                                  style: FlTextStyle.title6,
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cupon.expiryDate!.tiempoRestante(
                                cupon.expiryDate!,
                              ),
                              textAlign: TextAlign.start,
                              style: FlTextStyle.description2,
                            ),
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
                  child: Text(
                    cupon.type.contains('Descuento')
                        ? '${cupon.percentage} %'
                        : r'$ ' '${cupon.amount}',
                    style: const TextStyle(
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
