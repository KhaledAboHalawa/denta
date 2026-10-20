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

  @override
  String get registerFirstNameHint => 'أدخل اسمك الأول هنا';

  @override
  String get registerFirstNameLabel => 'الاسم الأول';

  @override
  String get registerLastNameHint => 'أدخل اسم العائلة هنا';

  @override
  String get registerLastNameLabel => 'اسم العائلة';

  @override
  String get registerDentistEmailHint => 'yourname@university.edu.eg';

  @override
  String get registerPatientEmailHint => 'أدخل بريدك الإلكتروني هنا';

  @override
  String get registerDentistEmailLabel => 'البريد الجامعي';

  @override
  String get registerPatientEmailLabel => 'البريد الإلكتروني';

  @override
  String get continueButton => 'متابعة';

  @override
  String get registerPasswordHint =>
      '...أدخل كلمة مرور مكونة من 8 أحرف على الأقل هنا';

  @override
  String get registerPasswordLabel => 'كلمة المرور';

  @override
  String get registerConfirmPasswordHint => 'أدخل تأكيد كلمة المرور هنا';

  @override
  String get registerConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get registerCreateAccount => 'إنشاء حساب';

  @override
  String get registerSubTitle =>
      'أنشئ ملفك الشخصي واعثر على الرعاية المناسبة بالقرب منك.';

  @override
  String get registerDivider => 'التسجيل';

  @override
  String get registerAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get registerSignIn => 'تسجيل الدخول';

  @override
  String get or => 'أو';

  @override
  String get withh => 'بواسطة';

  @override
  String get patient => 'أنا مريض';

  @override
  String get dentist => 'أنا طبيب أسنان';

  @override
  String get patientDesc =>
      'احصل على رعاية أسنان بأسعار معقولة وتحت إشراف من طلاب طب أسنان موثوق بهم بالقرب منك.';

  @override
  String get dentistDesc =>
      'اعثر على حالات سريرية، واحصل على تطابق مع المرضى القريبين، وقم بشراء أو بيع أو التبرع بالأدوات.';

  @override
  String get roleSelectionTitle => 'اي منهما تكون؟';

  @override
  String get roleSelectionSubtitle =>
      'هذا يساعدنا في إعداد التجربة المناسبة لك';

  @override
  String get onboardingExploreDenta => 'اكتشف Denta';

  @override
  String get onboardingTitle1 => 'حيث يلتقي علاج الأسنان بتعلّم طب الأسنان';

  @override
  String get onboardingDescription1 =>
      'يربط Denta بين طلاب طب الأسنان والمرضى، مما يجعل العلاج أكثر سهولة ويجعل التدريب السريري أكثر كفاءة.';

  @override
  String get onboardingTitle2 => 'مش عارف إيه المشكلة؟ إحنا هنساعدك تعرف';

  @override
  String get onboardingDescription2 =>
      'التقط صورة للمشكلة التي تعاني منها، وسيساعدك الذكاء الاصطناعي في تحديد الحالة، دون الحاجة إلى أي معرفة طبية.';

  @override
  String get onboardingTitle3 => 'الشخص المناسب، بالقرب منك';

  @override
  String get onboardingDescription3 =>
      'سواء كنت تبحث عن علاج أو عن حالة للتدريب عليها، يوصلك Denta بالشخص المناسب بالقرب من منزلك.';

  @override
  String get onboardingTitle4 => 'أكثر من مجرد حالات';

  @override
  String get onboardingDescription4 =>
      'اشترِ أو بِع أو تبرع بأدوات ومعدات طب الأسنان داخل مجتمع موثوق من الطلاب.';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingCreateYourAccount => 'أنشئ حسابك';

  @override
  String get onboardingAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get onboardingLogIn => 'تسجيل الدخول';
}
