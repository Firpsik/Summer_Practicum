import 'package:summer_practicum/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

final theme = ThemeData(
  cardTheme: const CardTheme(
    color: AppColors.card,
    margin: EdgeInsets.all(0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: 'Arial',
      fontWeight: FontWeight.w600,
      fontSize: 32,
      height: 1,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Arial',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.2,
      letterSpacing: 0.15,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Arial',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.1,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
        fontFamily: 'Arial',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.1,
        letterSpacing: 0.4,
        color: AppColors.card),
    labelSmall: TextStyle(
        fontFamily: 'Arial',
        fontWeight: FontWeight.w400,
        fontSize: 10,
        height: 1,
        letterSpacing: 0.4,
        color: AppColors.card),
  ),
  filledButtonTheme: const FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.button),
    ),
  ),
);