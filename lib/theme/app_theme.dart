import 'package:flutter/material.dart';
import 'package:money_tracker/theme/colors.dart';

class AppTheme {
  static final colors = AppColors();
  static final darkTheme = ThemeData.dark().copyWith(
    // selectedRowColor: colors.black,
    // unselectedWidgetColor: colors.grey,
    colorScheme: const ColorScheme.dark(),
  );
}