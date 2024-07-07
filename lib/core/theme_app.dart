import 'package:case_app/core/ca_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeApp = ThemeData(
  useMaterial3: true,
  iconTheme: const IconThemeData(
    color: CAColors.darkGray,
    size: 20,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: CAColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: CAColors.darkGray,
    ),
    bodyLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      color: CAColors.darkGray,
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: CAColors.yellowVariant,
    ),
    bodySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: CAColors.gray,
    ),
    labelMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: CAColors.blue,
    ),
    labelSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: CAColors.blue,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: CAColors.lightGrayVariant,
    ),
  ),
);
