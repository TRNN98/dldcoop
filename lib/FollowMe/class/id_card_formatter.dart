import 'package:flutter/services.dart';

class IdCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int selectionIndex;

    // Get the previous and current input strings
    String pText = oldValue.text;
    String cText = newValue.text;
    // Abbreviate lengths
    int cLen = cText.length;
    int pLen = pText.length;

    if (cLen == 1 && pLen == 0) {
      cText += '-';
    } else if (cLen == 6 && pLen == 5) {
      cText += '-';
    } else if (cLen == 12 && pLen == 11) {
      cText += '-';
    } else if (cLen == 15 && pLen == 14) {
      cText += '-';
    }

    selectionIndex = cText.length;
    return TextEditingValue(
      text: cText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
