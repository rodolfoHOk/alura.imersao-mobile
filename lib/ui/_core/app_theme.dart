import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.backgroundColor),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabledButtonColor;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.pressedButtonColor;
          }
          return AppColors.mainColor;
        }),
      ),
    ),
  );
}
