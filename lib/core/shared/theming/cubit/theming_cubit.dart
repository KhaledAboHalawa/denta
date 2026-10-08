import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/app_constants.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(this._prefs) : super(_initialMode(_prefs));

  final SharedPreferences _prefs;

  static ThemeMode _initialMode(SharedPreferences prefs) {
    final saved = prefs.getString(AppKeys.themeKey);
    return ThemeMode.values.firstWhere(
      (m) => m.name == saved,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (mode == state) return;
    await _prefs.setString(AppKeys.themeKey, mode.name);
    emit(mode);
  }

  Future<void> toggle(Brightness currentBrightness) => setThemeMode(
        currentBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark,
      );
}