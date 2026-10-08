// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'دنتا';

  @override
  String welcomeUser(String name) {
    return 'أهلاً، $name';
  }

  @override
  String patientsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count مريض',
      many: '$count مريضًا',
      few: '$count مرضى',
      two: 'مريضان',
      one: 'مريض واحد',
      zero: 'لا يوجد مرضى',
    );
    return '$_temp0';
  }
}
