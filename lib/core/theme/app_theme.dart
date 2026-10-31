import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static final ColorScheme _lightScheme =
      ColorScheme.fromSeed(
        seedColor: AppPalette.primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppPalette.primary,
        onPrimary: AppPalette.white,
        secondary: AppPalette.secondary,
        onSecondary: AppPalette.accent,
        secondaryContainer: AppPalette.secondary,
        onSecondaryContainer: AppPalette.accent,
        tertiary: AppPalette.accent,
        onTertiary: AppPalette.white,
        error: AppPalette.error,
        onError: AppPalette.white,
        surface: AppPalette.background,
        onSurface: AppPalette.textMain,
        outline: AppPalette.primary,
      );

  static final ColorScheme _darkScheme =
      ColorScheme.fromSeed(
        seedColor: AppPalette.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppPalette.primary,
        onPrimary: AppPalette.white,
        secondary: AppPalette.secondary,
        onSecondary: AppPalette.accent,
        secondaryContainer: AppPalette.accent,
        onSecondaryContainer: AppPalette.white,
        tertiary: AppPalette.secondary,
        onTertiary: AppPalette.accent,
        error: AppPalette.error,
        onError: AppPalette.white,
        surface: AppPalette.accent,
        onSurface: AppPalette.secondary,
        outline: AppPalette.primary,
      );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightScheme,

    extensions: const [AppColorsExtension.light],

    scaffoldBackgroundColor: _lightScheme.surface,

    fontFamily: AppTypography.fontFamily,

    textTheme: AppTypography.textTheme,

    appBarTheme: AppBarTheme(
      backgroundColor: _lightScheme.surface,
      foregroundColor: _lightScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    iconTheme: IconThemeData(color: _lightScheme.primary),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        minimumSize: const Size(0, 0),
        elevation: 0,
        textStyle: AppTypography.textTheme.labelLarge,
        backgroundColor: _lightScheme.primary,
        foregroundColor: _lightScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _lightScheme.primary, width: 1),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: _darkScheme,

    extensions: const [AppColorsExtension.dark],

    scaffoldBackgroundColor: _darkScheme.surface,

    fontFamily: AppTypography.fontFamily,

    textTheme: AppTypography.textTheme,

    appBarTheme: AppBarTheme(
      backgroundColor: _darkScheme.surface,
      foregroundColor: _darkScheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),

    iconTheme: IconThemeData(color: _darkScheme.secondary),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        minimumSize: const Size(0, 0),
        backgroundColor: _darkScheme.primary,
        foregroundColor: _darkScheme.onPrimary,
        textStyle: AppTypography.textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _lightScheme.primary, width: 1),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionHandleColor: Colors.transparent,
    ),
  );
}
