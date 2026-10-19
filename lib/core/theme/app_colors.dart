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
  static const Color infoHover = Color(0xFFD9E2E7);
  static const Color infoLight = Color(0xFFF3F6F7);
  static const Color textLight = Color(0xFFEDEDFB);
  static const Color inputFill = Color(0xFFF7F7F9);
  static const Color primaryLight = Color(0xFFE4E5FA);
}

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.success,
    required this.warning,
    required this.info,
    required this.inputFill,
    required this.error,
    required this.infoHover,
    required this.primaryLight,
    required this.infoLight,
  });

  final Color success;
  final Color warning;
  final Color error;
  final Color info;
  final Color inputFill;
  final Color infoHover;
  final Color infoLight;
  final Color primaryLight;

  static const light = AppColorsExtension(
    success: AppPalette.success,
    warning: AppPalette.warning,
    error: AppPalette.error,
    info: AppPalette.info,
    infoHover: AppPalette.infoHover,
    infoLight: AppPalette.infoLight,
    inputFill: AppPalette.inputFill,
    primaryLight: AppPalette.primaryLight,
  );

  static const dark = AppColorsExtension(
    success: AppPalette.success,
    warning: AppPalette.warning,
    error: AppPalette.error,
    info: AppPalette.info,
    infoHover: AppPalette.infoHover,
    infoLight: AppPalette.infoLight,
    inputFill: Color(0xFF252B40),
    primaryLight: AppPalette.primaryLight,
  );

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? infoLight,
    Color? inputFill,
    Color? infoHover,
    Color? primaryLight,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      infoHover: infoHover ?? this.infoHover,
      inputFill: inputFill ?? this.inputFill,
      primaryLight: primaryLight ?? this.primaryLight,
      infoLight: infoLight ?? this.infoLight,
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
      infoHover: Color.lerp(infoHover, other.infoHover, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      infoLight: Color.lerp(infoLight, other.infoLight, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
