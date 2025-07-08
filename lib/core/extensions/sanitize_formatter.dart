import 'package:flutter/services.dart';
import '../extensions/string_extensions.dart';

class SanitizeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.sanitize, selection: newValue.selection);
  }
}
