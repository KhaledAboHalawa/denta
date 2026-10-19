import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Single source of truth for all typography tokens (from the design system).
/// Colors are intentionally NOT set here; the theme applies them so that
/// light/dark mode work automatically.
abstract final class AppTypography {
  static const String fontFamily = 'PlusJakartaSans';

  // Weights
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  /// Figma line height (px) -> Flutter `height` multiplier.
  static TextStyle _style({
    required double size,
    required FontWeight weight,
    required double lineHeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      height: lineHeight / size,
      color: color,
      // Matches how Figma distributes line height (evenly top/bottom).
      leadingDistribution: TextLeadingDistribution.even,
    );
  }

  // ───────────── Design-system styles ─────────────
  static final TextStyle displayLarge = _style(
    size: 32,
    weight: _bold,
    lineHeight: 40,
    color: AppPalette.textMain,
  );

  static final TextStyle heading1 = _style(
    size: 28,
    weight: _bold,
    lineHeight: 36,
  );
  static final TextStyle heading2 = _style(
    size: 24,
    weight: _semiBold,
    lineHeight: 32,
  );
  static final TextStyle heading3 = _style(
    size: 20,
    weight: _semiBold,
    lineHeight: 28,
  );

  static final TextStyle bodyLarge = _style(
    size: 18,
    weight: _regular,
    lineHeight: 28,
  );
  static final TextStyle bodyDefault = _style(
    size: 16,
    weight: _regular,
    lineHeight: 24,
  );
  static final TextStyle bodyMedium = _style(
    size: 16,
    weight: _medium,
    lineHeight: 24,
    color: AppPalette.textMain,
  );
  static final TextStyle labelDefault = _style(
    size: 14,
    weight: _medium,
    lineHeight: 20,
    color: AppPalette.textMain,
  );
  static final TextStyle captionDefault = _style(
    size: 12,
    weight: _regular,
    lineHeight: 16,
    color: AppPalette.info,
  );
  static final TextStyle buttonDefault = _style(
    size: 16,
    weight: _semiBold,
    lineHeight: 24,
    color: AppPalette.white,
  );

  static TextTheme get textTheme => TextTheme(
    displayLarge: displayLarge,
    headlineLarge: heading1,
    headlineMedium: heading2,
    headlineSmall: heading3,
    titleLarge: heading3,
    titleMedium: bodyMedium,
    bodyLarge: bodyLarge,
    bodyMedium: bodyDefault,
    bodySmall: captionDefault,
    labelLarge: buttonDefault,
    labelMedium: labelDefault,
    labelSmall: captionDefault,
  );
}

extension AppTextContext on BuildContext {
  AppTextStyles get text => AppTextStyles(Theme.of(this).textTheme);
}

class AppTextStyles {
  const AppTextStyles(this._t);
  final TextTheme _t;

  TextStyle get displayLarge => _t.displayLarge!;
  TextStyle get heading1 => _t.headlineLarge!;
  TextStyle get heading2 => _t.headlineMedium!;
  TextStyle get heading3 => _t.headlineSmall!;
  TextStyle get bodyLarge => _t.bodyLarge!;
  TextStyle get bodyDefault => _t.bodyMedium!;
  TextStyle get bodyMedium => _t.titleMedium!;
  TextStyle get labelDefault => _t.labelMedium!;
  TextStyle get captionDefault => _t.bodySmall!;
  TextStyle get buttonDefault => _t.labelLarge!;
}
