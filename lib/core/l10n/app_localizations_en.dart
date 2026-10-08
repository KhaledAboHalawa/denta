// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Denta';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name';
  }

  @override
  String patientsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count patients',
      one: '1 patient',
      zero: 'No patients',
    );
    return '$_temp0';
  }
}
