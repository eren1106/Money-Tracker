import 'package:flutter/material.dart';
import 'package:money_tracker/theme/colors.dart';

class AppTheme {
  static final colors = AppColors();
  static final darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: colors.backgroundBlue,
    backgroundColor: colors.black,
    primaryColor: colors.white,
    secondaryHeaderColor: colors.grey,
  );
}