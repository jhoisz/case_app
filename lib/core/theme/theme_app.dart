import 'package:flutter/material.dart';

import 'ca_colors.dart';

ThemeData themeApp = ThemeData(
  scaffoldBackgroundColor: CAColors.white,
  useMaterial3: true,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CAColors.blue,
    selectionColor: CAColors.blue.withOpacity(0.2),
    selectionHandleColor: CAColors.blue,
  ),
  primaryColor: CAColors.blue,
  indicatorColor: CAColors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: CAColors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: CAColors.blue,
    ),
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: CAColors.blue,
    ),
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
      fontSize: 16,
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
