import 'package:flutter/material.dart';

abstract final class AppPalette {
  // Brand
  static const Color primary = Color(0xFF3E3FAF);
  static const Color secondary = Color(0xFFD3D5FF);
  static const Color accent = Color(0xFF151D3C);

  // Semantic colors
  static const Color success = Color(0xFF4ADE80);
  static const Color error = Color(0xFFF43F5E);
  static const Color warning = Color(0xFFFBBF24);
  static const Color info = Color(0xFF85A0B2);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color textMain = Color(0xFF1C1D1D);
  static const Color textLight = Color(0xFFEDEDFB);
  static const Color inputFill = Color(0xFFF7F7F9);
}

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.success,
    required this.warning,
    required this.info,
    required this.inputFill,
    required this.error,
  });

  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color inputFill;

  static const light = AppColorsExtension(
    success: AppPalette.success,
    warning: AppPalette.warning,
    error: AppPalette.error,
    info: AppPalette.info,
    inputFill: AppPalette.inputFill,
  );

  static const dark = AppColorsExtension(
    success: AppPalette.success,
    warning: AppPalette.warning,
    error: AppPalette.error,
    info: AppPalette.info,
    inputFill: Color(0xFF252B40),
  );

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? inputFill,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      inputFill: inputFill ?? this.inputFill,
    );
  }

  @override
  AppColorsExtension lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
