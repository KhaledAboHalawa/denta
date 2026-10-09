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

  @override
  String get noContentError => 'لا يوجد محتوى متاح.';

  @override
  String get badRequestError => 'طلب غير صالح. يرجى التحقق من المدخلات.';

  @override
  String get unAuthenticationError =>
      'فشل في المصادقة. يرجى تسجيل الدخول مجددًا.';

  @override
  String get forbiddenError => 'تم رفض الوصول.';

  @override
  String get internalServerError =>
      'خطأ داخلي في الخادم. يرجى المحاولة مرة أخرى لاحقًا.';

  @override
  String get notFoundError => 'المورد غير موجود.';

  @override
  String get conflictError => 'حدث تعارض. يرجى إعادة المحاولة.';

  @override
  String get apiLogicalError => 'أرجع الخادم خطأ منطقياً.';

  @override
  String get connectTimeoutError => 'انتهت مهلة الاتصال.';

  @override
  String get cancelError => 'تم إلغاء الطلب.';

  @override
  String get receiveTimeoutError => 'انتهت مهلة الاستلام.';

  @override
  String get sendTimeoutError => 'انتهت مهلة الإرسال.';

  @override
  String get cacheError => 'حدث خطأ في الذاكرة المؤقتة.';

  @override
  String get noInternetConnectionError => 'لا يوجد اتصال بالإنترنت.';

  @override
  String get defaultError => 'حدث خطأ غير متوقع.';
}
