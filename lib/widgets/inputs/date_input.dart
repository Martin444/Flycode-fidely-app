import 'package:flutter/material.dart';

import '../../utils/colors/fl_colors.dart';
import '../../utils/styles_fonts/fonts_styles.dart';

class DateInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  const DateInputField({
    super.key,
    required this.labelText,
    required this.controller,
  });
  @override
  // ignore: library_private_types_in_public_api
  _DateInputFieldState createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      helpText: 'Por lo general un mes es un buen periodo',
      locale: const Locale('es'),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            '${pickedDate.day.toString()}/${pickedDate.month.toString()}/${pickedDate.year.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: FlTextStyle.description2,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: widget.controller,
          readOnly: true, // El usuario no puede editar el campo directamente
          onTap: () => _selectDate(context),
          style: FlTextStyle.description2,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: FlColors.withe2,
              ),
            ),
            filled: true,
            focusColor: Colors.white,
            fillColor: Colors.white.withOpacity(0.3),
            errorStyle: TextStyle(
              color: FlColors.withe2,
              decoration: TextDecoration.lineThrough,
            ),
            alignLabelWithHint: true,
            //labelText: labelText,
            floatingLabelStyle: FlTextStyle.textInput1,
          ),
        ),
      ],
    );
  }
}
