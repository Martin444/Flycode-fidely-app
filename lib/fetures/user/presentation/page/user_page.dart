import 'package:flutter/material.dart';
import 'package:flycode/utils/colors/fl_colors.dart';
import 'package:flycode/widgets/carrousel.dart';
import 'package:flycode/widgets/disscount.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlColors.primaryColorsBackground,
      body: Column(
        children: [
          Container(
            height: 100,
            child: Carrousel(
              children: [
                DiscountCard(
                  title: 'Este es el descuento uno 1',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
                DiscountCard(
                  title: 'Este es el descuento uno 2',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
                DiscountCard(
                  title: 'Este es el descuento uno 3',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
                DiscountCard(
                  title: 'Este es el descuento uno 4',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
                DiscountCard(
                  title: 'Este es el descuento uno 5',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
                DiscountCard(
                  title: 'Este es el descuento uno 6',
                  imageUrl:
                      'https://www.bing.com/th?id=ALSTUF4DBD5C1B72DA87EEB0A6ADB4322EB48FB797D25D0669BA3EC4745CFFA06A672&pid=cdx&w=320&h=189&c=7',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
