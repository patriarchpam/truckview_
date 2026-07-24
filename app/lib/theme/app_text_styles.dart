import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heading = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.brandNavy,
  );

  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.brandNavy,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textLight,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 13,
    color: AppColors.mutedLight,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
