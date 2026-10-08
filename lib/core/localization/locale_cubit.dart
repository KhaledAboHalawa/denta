import 'dart:ui';

import 'package:denta/core/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(this._prefs) : super(_initialLocale(_prefs));

  static const supportedLocales = [Locale('en'), Locale('ar')];

  final SharedPreferences _prefs;

  /// Saved language first, then device language, then English.
  static Locale _initialLocale(SharedPreferences prefs) {
    final saved = prefs.getString(AppKeys.localeKey);
    final deviceCode = PlatformDispatcher.instance.locale.languageCode;

    for (final code in [saved, deviceCode]) {
      final match = supportedLocales.where((l) => l.languageCode == code);
      if (match.isNotEmpty) return match.first;
    }
    return const Locale(AppKeys.enLocaleCode);
  }

  Future<void> setLocale(Locale locale) async {
    if (!supportedLocales.contains(locale) || locale == state) return;
    await _prefs.setString(AppKeys.localeKey, locale.languageCode);
    emit(locale);
  }

  Future<void> toggle() => setLocale(
    state.languageCode == AppKeys.arLocaleCode
        ? const Locale(AppKeys.enLocaleCode)
        : const Locale(AppKeys.arLocaleCode),
  );
}
