import 'package:flutter/material.dart';
import 'package:flycode/utils/styles_fonts/fonts_styles.dart';

class InputDropDown extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> items;

  final Function(String) onSelect;

  const InputDropDown({
    super.key,
    required this.items,
    required this.onSelect,
    required this.label,
    required this.hintText,
  });

  @override
  State<InputDropDown> createState() => _InputDropDownState();
}

class _InputDropDownState extends State<InputDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: FlTextStyle.description2,
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField<String>(
          value: selectedValue,
          iconEnabledColor: Colors.white.withOpacity(0.5),
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            iconColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.9),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          focusColor: Colors.transparent,
          style: FlTextStyle.description2,
          dropdownColor: Colors.grey.withOpacity(0.9),
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: FlTextStyle.description2,
          ),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: FlTextStyle.description2,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            widget.onSelect(newValue!);
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ],
    );
  }
}
