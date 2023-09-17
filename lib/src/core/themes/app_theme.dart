import 'package:flutter/material.dart';
import 'package:forecast_app/src/core/utils/app_strings.dart';

import '../utils/app_colors.dart';
import 'color_schemes.g.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    fontFamily: AppStrings.appFont,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryBLue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.blue,
      titleTextStyle: TextStyle(
          color: AppColor.black, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    useMaterial3: true,
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: AppColor.blue,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryBLue),
      hintStyle: const TextStyle(
          color: AppColor.white2, fontSize: 14, fontWeight: FontWeight.w500),
      errorStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: AppColor.white2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: AppColor.white2)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.primaryBLue, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );
  static ThemeData darkThemeData = ThemeData(
    fontFamily: AppStrings.appFont,
    brightness: Brightness.dark,
    // primaryColor: AppColor.primaryBLue,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      // backgroundColor: AppColor.backgroundBLue,
      titleTextStyle: TextStyle(
          color: AppColor.white, fontWeight: FontWeight.w500, fontSize: 20),
    ),
    useMaterial3: true,
    colorScheme: darkColorScheme,
    // scaffoldBackgroundColor: AppColor.backgroundBLue,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColor.primaryBLue),
      hintStyle: const TextStyle(
          color: AppColor.white2, fontSize: 14, fontWeight: FontWeight.w500),
      errorStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: AppColor.white2)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(color: AppColor.white2)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.primaryBLue, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(32),
      ),
    ),
  );
}
