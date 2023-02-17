import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryContainerColor,
    ),
    fontFamily: "Shabnam",
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: Colors.black,
      secondary: AppColors.primaryColor,
      onSecondary: Colors.black,
      primaryContainer: AppColors.primaryContainerColor,
      error: AppColors.redColor,
      onError: Colors.white,
      background: AppColors.backgroundColor,
      onBackground: Colors.black,
      surface: AppColors.backgroundColor,
      onSurface: Colors.black,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryContainerDarkColor,
    ),
    fontFamily: "Shabnam",
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,
      primaryContainer: AppColors.primaryContainerDarkColor,
      error: AppColors.redColor,
      onError: Colors.white,
      background: AppColors.backgroundDarkColor,
      onBackground: Colors.white,
      surface: AppColors.backgroundDarkColor,
      onSurface: Colors.white,
    ),
  );
}
