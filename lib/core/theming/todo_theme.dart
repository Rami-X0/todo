import 'package:flutter/material.dart';
import 'package:todo/core/theming/colors.dart';

class TodoTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.secondaryColor,
      selectionColor: ColorsManager.secondaryColor.withOpacity(0.5),
      selectionHandleColor: ColorsManager.secondaryColor,
    ),
  );
}
