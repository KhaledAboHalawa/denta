import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() => _build(_lightScheme);
  static ThemeData dark() => _build(_darkScheme);

  static final ColorScheme _lightScheme = ColorScheme.fromSeed(
    seedColor: AppColors.dentaBlue,
    brightness: Brightness.light,
  ).copyWith(
    primary: AppColors.dentaBlue,
    onPrimary: AppColors.white,
    secondary: AppColors.softLavender,
    onSecondary: AppColors.deepNavy,
    secondaryContainer: AppColors.softLavender,
    onSecondaryContainer: AppColors.deepNavy,
    tertiary: AppColors.deepNavy,
    onTertiary: AppColors.white,
    surface: AppColors.white,
    onSurface: AppColors.deepNavy,
  );

  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: AppColors.dentaBlue,
    brightness: Brightness.dark,
  ).copyWith(
    primary: AppColors.softLavender,
    onPrimary: AppColors.deepNavy,
    secondary: AppColors.dentaBlue,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.dentaBlue,
    onSecondaryContainer: AppColors.white,
    surface: AppColors.deepNavy,
    onSurface: AppColors.white,
  );

  static ThemeData _build(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: scheme.onSurface,
        displayColor: scheme.onSurface,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      iconTheme: IconThemeData(color: scheme.primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
        ),
      ),
    );
  }
}