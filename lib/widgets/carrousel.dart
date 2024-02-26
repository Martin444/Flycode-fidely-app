import 'package:flutter/material.dart';

class Carrousel extends StatelessWidget {
  final List<Widget> children;

  const Carrousel({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (children.length / 2)
            .ceil(), // Mostrar dos elementos por cada vista
        itemBuilder: (BuildContext context, int index) {
          final int firstIndex = index * 2;
          final int secondIndex = firstIndex + 1;

          return Row(
            children: [
              Flexible(child: children[firstIndex]),
              if (secondIndex < children.length)
                Flexible(child: children[secondIndex]),
            ],
          );
        },
      ),
    );
  }
}
