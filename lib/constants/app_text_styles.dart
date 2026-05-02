import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    height: 1.2,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    height: 1.3,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    color: AppColors.grayLight,
    height: 1.6,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    color: AppColors.grayLight,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    color: AppColors.grayLighter,
  );

  // ✅ goldGradientText dipindah jadi method, bukan static field
  static TextStyle goldGradientText() => TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    foreground: Paint()
      ..shader = AppColors.goldGradient.createShader(
        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
      ),
  );
}
