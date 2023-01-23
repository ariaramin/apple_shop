import 'package:apple_shop/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: "Shabnam",
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundDarkColor,
    scaffoldBackgroundColor: AppColors.backgroundDarkColor,
    fontFamily: "Shabnam",
  );
}
