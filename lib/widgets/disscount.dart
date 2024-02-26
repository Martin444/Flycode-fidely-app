import 'package:flutter/material.dart';
import 'package:flycode/widgets/card_glass.dart';

class DiscountCard extends StatelessWidget {
  final String title;
  final String? description;
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: CardBlured(
                  child: Column(
                    children: [
                      // imagen del producto
                      Image.network(imageUrl),

                      //informacion adicional
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            if (description != null) ...[
                              const SizedBox(height: 8),
                              Text(description!),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //seccion de descuento
              Positioned(
                top: -10,
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
