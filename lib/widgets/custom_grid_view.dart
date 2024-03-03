import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  final List<Widget> widgets;

  const CustomGridView({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Puedes ajustar el número de columnas aquí
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return widgets[index];
        },
      ),
    );
  }
}
