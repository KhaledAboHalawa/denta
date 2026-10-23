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
  String get signInEmailHint => 'أدخل بريدك الإلكتروني هنا';

  @override
  String get signInEmailLabel => 'البريد الإلكتروني';

  @override
  String get signInPasswordHint => 'أدخل كلمة المرور هنا';

  @override
  String get signInPasswordLabel => 'كلمة المرور';

  @override
  String get signInTitle => 'أهلاً، سعيد برؤيتك مرة أخرى!';

  @override
  String get signInSubTitle => 'سجل الدخول لتكمل من حيث توقفت.';

  @override
  String get forgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get rememberMe => 'تذكرني';

  @override
  String get logIn => 'تسجيل الدخول';

  @override
  String get dontHaveAccount => 'ليس لديك حساب بعد؟ ';

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
  String get forgotPasswordTitle => 'هل نسيت كلمة المرور؟';

  @override
  String get forgotPasswordSubTitle =>
      'لا تقلق، هذا يحدث. أدخل بريدك الإلكتروني وسنرسل لك رمزًا لاستعادة الوصول إلى حسابك.';

  @override
  String get sendCode => 'إرسال الرمز';

  @override
  String get otpTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String otpDescription(String email) {
    return 'أرسلنا رمزًا مكوّنًا من 4 أرقام إلى $email. أدخله بالأسفل للمتابعة.';
  }

  @override
  String get verifyCode => 'تحقق من الرمز';

  @override
  String get didntGetIt => 'لم يصلك الرمز؟';

  @override
  String get resendCode => 'إعادة إرسال الرمز';

  @override
  String get otpInvalidCode => 'من فضلك أدخل الرمز المكوّن من 4 أرقام.';

  @override
  String get otpVerificationFailed => 'فشل التحقق من الرمز. حاول مرة أخرى.';

  @override
  String get otpResendFailed => 'تعذرت إعادة إرسال الرمز. حاول مرة أخرى.';

  @override
  String get otpResendMockSuccess => 'تمت محاكاة طلب إعادة إرسال الرمز بنجاح.';

  @override
  String get otpVerificationMockSuccess =>
      'نجح التحقق التجريبي. لم يتم ربط التحقق بالخادم بعد.';

  @override
  String get resetPasswordTitle => 'أنشئ كلمة مرور جديدة';

  @override
  String get resetPasswordDescription => 'اختر كلمة مرور يسهل عليك تذكّرها.';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get createPasswordHint => 'أنشئ كلمة مرور من 8 أحرف على الأقل...';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get confirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get resetPasswordButton => 'إعادة تعيين كلمة المرور';

  @override
  String get passwordRequired => 'من فضلك أدخل كلمة المرور.';

  @override
  String get passwordMinLength => 'يجب ألا تقل كلمة المرور عن 8 أحرف.';

  @override
  String get confirmPasswordRequired => 'من فضلك أكّد كلمة المرور.';

  @override
  String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get resetPasswordSuccessTitle => 'لقد عدت بنجاح!';

  @override
  String get resetPasswordSuccessDescription =>
      'تمت إعادة تعيين كلمة المرور. يمكنك الآن المتابعة من حيث توقفت.';

  @override
  String get backToLogin => 'العودة إلى تسجيل الدخول';
  String get onboardingExploreDenta => 'اكتشف دنتا';

  @override
  String onboardingTitle(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'حيث تلتقي رعاية الأسنان بتعلّم طب الأسنان',
      '1': 'لست متأكدًا مما تعانيه؟ سنساعدك على معرفته',
      '2': 'مطابقة قريبة منك، ومطابقة مناسبة لك',
      '3': 'أكثر من مجرد حالات',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String onboardingDescription(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'تربط دنتا بين طلاب طب الأسنان والمرضى، لتجعل العلاج أسهل في الوصول والتدريب الإكلينيكي أكثر كفاءة.',
      '1': 'التقط صورة لمشكلتك، ويساعدك الذكاء الاصطناعي على تحديد الحالة، دون الحاجة لأي معرفة طبية.',
      '2': 'سواء كنت تبحث عن علاج أو عن حالة، تربطك دنتا بالشخص المناسب القريب من منزلك.',
      '3': 'اشترِ أو بع أو تبرّع بأدوات ومعدات طب الأسنان داخل مجتمع طلابي موثوق.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingCreateYourAccount => 'أنشئ حسابك';

  @override
  String get onboardingAlreadyHaveAccount => 'لديك حساب بالفعل؟ ';

  @override
  String get onboardingLogIn => 'تسجيل الدخول';

  @override
  String get thisField => 'هذا الحقل';

  @override
  String get nameField => 'الاسم';

  @override
  String get phoneNumberField => 'رقم الهاتف';

  @override
  String get confirmPasswordField => 'تأكيد كلمة المرور';

  @override
  String fieldRequiredError(String fieldName) {
    return '$fieldName مطلوب';
  }

  @override
  String fieldMinLengthError(String fieldName, int minLength) {
    return 'يجب ألا يقل $fieldName عن $minLength أحرف';
  }

  @override
  String fieldMaxLengthError(String fieldName, int maxLength) {
    return 'يجب ألا يتجاوز $fieldName $maxLength حرفًا';
  }

  @override
  String nameLettersOnlyError(String fieldName) {
    return 'يمكن أن يحتوي $fieldName على حروف ومسافات وعلامات وصل وفواصل عليا فقط';
  }

  @override
  String get emailRequiredError => 'البريد الإلكتروني مطلوب';

  @override
  String get invalidEmailError => 'يرجى إدخال بريد إلكتروني صالح';

  @override
  String invalidPhoneError(String fieldName) {
    return 'يرجى إدخال $fieldName صالح';
  }

  @override
  String get passwordRequiredError => 'كلمة المرور مطلوبة';

  @override
  String passwordMinLengthError(int minLength) {
    return 'يجب أن تتكون كلمة المرور من $minLength أحرف على الأقل';
  }

  @override
  String get passwordUppercaseError =>
      'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';

  @override
  String get passwordLowercaseError =>
      'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';

  @override
  String get passwordDigitError =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';

  @override
  String get passwordSpecialCharError =>
      'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';

  @override
  String get passwordsDoNotMatchError => 'كلمتا المرور غير متطابقتين';

  @override
  String invalidNumberError(String fieldName) {
    return 'يجب أن يكون $fieldName رقمًا صالحًا';
  }

  @override
  String numberMinError(String fieldName, num min) {
    return 'يجب ألا يقل $fieldName عن $min';
  }

  @override
  String numberMaxError(String fieldName, num max) {
    return 'يجب ألا يتجاوز $fieldName $max';
  }
}
