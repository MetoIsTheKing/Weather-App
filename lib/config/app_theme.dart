import 'package:flutter/material.dart';
import 'package:weather_app/core/app_colors.dart';
import 'package:weather_app/core/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.appGrey,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.appDarkBlue,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.appDarkBlue,
        )),
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      //Labels
      labelLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      //Body Text
      bodyLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400),
      bodySmall: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400),
      //Title Text
      titleLarge: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          fontFamily: AppStrings.fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w700),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.appWhite,
      textColor: AppColors.appWhite,
    ),
  );
}
