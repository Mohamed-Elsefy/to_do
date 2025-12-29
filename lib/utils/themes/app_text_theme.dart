import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/app_colors.dart';

abstract class AppTextTheme {
  static TextTheme get light => const TextTheme(
    labelLarge: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.background,
    ),

    labelSmall: TextStyle(
      color: AppColors.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),

    titleMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    titleSmall: TextStyle(
      color: AppColors.background,
      fontSize: 14,
      fontWeight: FontWeight.w100,
    ),

    bodyMedium: TextStyle(
      color: AppColors.primary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}
