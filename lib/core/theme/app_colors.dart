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
  static const Color secondaryLight = Color(0xFFF1F2FF);
  static const Color primaryBorder = Color(0xFFC8C8F4);
  static const Color infoDark = Color(0xFF7890A0);
}

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.white,
    required this.background,
    required this.textMain,
    required this.infoHover,
    required this.infoLight,
    required this.textLight,
    required this.inputFill,
    required this.primaryLight,
    required this.secondaryLight,
    required this.primaryBorder,
    required this.infoDark,
  });

  // Brand
  final Color primary;
  final Color secondary;
  final Color accent;

  // Semantic
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  // Neutral
  final Color white;
  final Color background;
  final Color textMain;
  final Color infoHover;
  final Color infoLight;
  final Color textLight;
  final Color inputFill;
  final Color primaryLight;
  final Color secondaryLight;
  final Color primaryBorder;
  final Color infoDark;

  static const light = AppColorsExtension(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    accent: AppPalette.accent,
    success: AppPalette.success,
    error: AppPalette.error,
    warning: AppPalette.warning,
    info: AppPalette.info,
    white: AppPalette.white,
    background: AppPalette.background,
    textMain: AppPalette.textMain,
    infoHover: AppPalette.infoHover,
    infoLight: AppPalette.infoLight,
    textLight: AppPalette.textLight,
    inputFill: AppPalette.inputFill,
    primaryLight: AppPalette.primaryLight,
    secondaryLight: AppPalette.secondaryLight,
    primaryBorder: AppPalette.primaryBorder,
    infoDark: AppPalette.infoDark,
  );

  static const dark = AppColorsExtension(
    primary: AppPalette.primary,
    secondary: AppPalette.secondary,
    accent: AppPalette.accent,
    success: AppPalette.success,
    error: AppPalette.error,
    warning: AppPalette.warning,
    info: AppPalette.info,
    white: AppPalette.white,
    background: AppPalette.background,
    textMain: AppPalette.textMain,
    infoHover: AppPalette.infoHover,
    infoLight: AppPalette.infoLight,
    textLight: AppPalette.textLight,
    inputFill: Color(0xFF252B40),
    primaryLight: AppPalette.primaryLight,
    secondaryLight: AppPalette.secondaryLight,
    primaryBorder: AppPalette.primaryBorder,
    infoDark: AppPalette.infoDark,
  );

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
    Color? white,
    Color? background,
    Color? textMain,
    Color? infoHover,
    Color? infoLight,
    Color? textLight,
    Color? inputFill,
    Color? primaryLight,
    Color? secondaryLight,
    Color? primaryBorder,
    Color? infoDark,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      white: white ?? this.white,
      background: background ?? this.background,
      textMain: textMain ?? this.textMain,
      infoHover: infoHover ?? this.infoHover,
      infoLight: infoLight ?? this.infoLight,
      textLight: textLight ?? this.textLight,
      inputFill: inputFill ?? this.inputFill,
      primaryLight: primaryLight ?? this.primaryLight,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      primaryBorder: primaryBorder ?? this.primaryBorder,
      infoDark: infoDark ?? this.infoDark,
    );
  }

  @override
  AppColorsExtension lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      white: Color.lerp(white, other.white, t)!,
      background: Color.lerp(background, other.background, t)!,
      textMain: Color.lerp(textMain, other.textMain, t)!,
      infoHover: Color.lerp(infoHover, other.infoHover, t)!,
      infoLight: Color.lerp(infoLight, other.infoLight, t)!,
      textLight: Color.lerp(textLight, other.textLight, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      secondaryLight: Color.lerp(secondaryLight, other.secondaryLight, t)!,
      primaryBorder: Color.lerp(primaryBorder, other.primaryBorder, t)!,
      infoDark: Color.lerp(infoDark, other.infoDark, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
