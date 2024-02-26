import 'package:flutter/services.dart';
import 'package:intl/intl.dart'; // Importa el paquete intl

class CurrencyInputFormatter extends TextInputFormatter {
  // Formatea el valor como moneda
  String formatCurrency(String value) {
    final formatter = NumberFormat.simpleCurrency(
      locale: 'es_MX',
      name: r'$',
    ); // Cambia la configuración regional según tus necesidades
    double? parsedValue = double.tryParse(value);
    return formatter.format(parsedValue!);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final formattedText = formatCurrency(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
