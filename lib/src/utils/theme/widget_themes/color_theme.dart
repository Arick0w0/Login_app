import 'dart:ui';

import 'package:flutter/material.dart';

Color getColorBasedOnTheme(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;
}
