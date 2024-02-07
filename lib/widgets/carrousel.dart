import 'package:flutter/material.dart';

class Carrousel extends StatelessWidget {
  final List<Widget> children;

  Carrousel({required this.children});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: (children.length / 2).ceil(),
      itemBuilder: (BuildContext context, int index) {
        final int firstIndex = index * 2;
        final int secondIndex = firstIndex + 1;

        return Row(
          children: [
            Expanded(child: children[firstIndex]),
            if (secondIndex < children.length)
              Expanded(child: children[secondIndex]),
          ],
        );
      },
    );
  }
}
