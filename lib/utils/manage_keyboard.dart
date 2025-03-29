import 'package:flutter/material.dart';

class KeyBoardUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocues = FocusScope.of(context);
    if (!currentFocues.hasPrimaryFocus) {
      currentFocues.unfocus();
    }
  }
}
