import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Denta'**
  String get appTitle;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}'**
  String welcomeUser(String name);

  /// No description provided for @patientsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No patients} =1{1 patient} other{{count} patients}}'**
  String patientsCount(int count);

  /// No description provided for @noContentError.
  ///
  /// In en, this message translates to:
  /// **'No content available.'**
  String get noContentError;

  /// No description provided for @badRequestError.
  ///
  /// In en, this message translates to:
  /// **'Bad request. Please check your input.'**
  String get badRequestError;

  /// No description provided for @unAuthenticationError.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please login again.'**
  String get unAuthenticationError;

  /// No description provided for @forbiddenError.
  ///
  /// In en, this message translates to:
  /// **'Access forbidden.'**
  String get forbiddenError;

  /// No description provided for @internalServerError.
  ///
  /// In en, this message translates to:
  /// **'Internal server error. Please try again later.'**
  String get internalServerError;

  /// No description provided for @notFoundError.
  ///
  /// In en, this message translates to:
  /// **'Resource not found.'**
  String get notFoundError;

  /// No description provided for @conflictError.
  ///
  /// In en, this message translates to:
  /// **'A conflict occurred. Please retry.'**
  String get conflictError;

  /// No description provided for @apiLogicalError.
  ///
  /// In en, this message translates to:
  /// **'API returned a logical error.'**
  String get apiLogicalError;

  /// No description provided for @connectTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Connection timeout occurred.'**
  String get connectTimeoutError;

  /// No description provided for @cancelError.
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled.'**
  String get cancelError;

  /// No description provided for @receiveTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Receive timeout occurred.'**
  String get receiveTimeoutError;

  /// No description provided for @sendTimeoutError.
  ///
  /// In en, this message translates to:
  /// **'Send timeout occurred.'**
  String get sendTimeoutError;

  /// No description provided for @cacheError.
  ///
  /// In en, this message translates to:
  /// **'Cache error occurred.'**
  String get cacheError;

  /// No description provided for @noInternetConnectionError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection.'**
  String get noInternetConnectionError;

  /// No description provided for @defaultError.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred.'**
  String get defaultError;

  /// No description provided for @registerFirstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your First name here'**
  String get registerFirstNameHint;

  /// No description provided for @registerFirstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get registerFirstNameLabel;

  /// No description provided for @registerLastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Last name here'**
  String get registerLastNameHint;

  /// No description provided for @registerLastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get registerLastNameLabel;

  /// No description provided for @registerDentistEmailHint.
  ///
  /// In en, this message translates to:
  /// **'yourname@university.edu.eg'**
  String get registerDentistEmailHint;

  /// No description provided for @registerPatientEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your Email here'**
  String get registerPatientEmailHint;

  /// No description provided for @registerDentistEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'University E-mail'**
  String get registerDentistEmailLabel;

  /// No description provided for @registerPatientEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get registerPatientEmailLabel;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @registerPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Create Password with at least 8 characters here...'**
  String get registerPasswordHint;

  /// No description provided for @registerPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get registerPasswordLabel;

  /// No description provided for @registerConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your Password here'**
  String get registerConfirmPasswordHint;

  /// No description provided for @registerConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get registerConfirmPasswordLabel;

  /// No description provided for @signInEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email here'**
  String get signInEmailHint;

  /// No description provided for @signInEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'E-mail'**
  String get signInEmailLabel;

  /// No description provided for @signInPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password here'**
  String get signInPasswordHint;

  /// No description provided for @signInPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInPasswordLabel;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Hey, Welcome Back!'**
  String get signInTitle;

  /// No description provided for @signInSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to pick up right where you left off.'**
  String get signInSubTitle;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account yet? '**
  String get dontHaveAccount;

  /// No description provided for @registerCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get registerCreateAccount;

  /// No description provided for @registerSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Set up your profile and find the right care, nearby.'**
  String get registerSubTitle;

  /// No description provided for @registerDivider.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get registerDivider;

  /// No description provided for @registerAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get registerAlreadyHaveAccount;

  /// No description provided for @registerSignIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get registerSignIn;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @withh.
  ///
  /// In en, this message translates to:
  /// **'with'**
  String get withh;

  /// No description provided for @patient.
  ///
  /// In en, this message translates to:
  /// **'I\'m a patient'**
  String get patient;

  /// No description provided for @dentist.
  ///
  /// In en, this message translates to:
  /// **'I\'m a dental student'**
  String get dentist;

  /// No description provided for @patientDesc.
  ///
  /// In en, this message translates to:
  /// **'Get affordable, supervised dental care from trusted dental students near you.'**
  String get patientDesc;

  /// No description provided for @dentistDesc.
  ///
  /// In en, this message translates to:
  /// **'Find clinical cases, get matched with patients nearby, and buy, sell, or donate dental tools.'**
  String get dentistDesc;

  /// No description provided for @roleSelectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Which One Are You?'**
  String get roleSelectionTitle;

  /// No description provided for @roleSelectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us set up the right experience for you.'**
  String get roleSelectionSubtitle;

  /// No description provided for @onboardingExploreDenta.
  ///
  /// In en, this message translates to:
  /// **'Explore Denta'**
  String get onboardingExploreDenta;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'{page, select, 0{Where Dental Care Meets Dental Learning} 1{Not Sure What\'s Wrong? We\'ll Help You Find Out} 2{Matched Nearby, Matched Right} 3{More Than Just Cases} other{}}'**
  String onboardingTitle(String page);

  /// No description provided for @onboardingDescription.
  ///
  /// In en, this message translates to:
  /// **'{page, select, 0{Denta connects dental students and patients, making treatment more accessible and clinical training more efficient.} 1{Snap a photo of your concern, and our AI helps identify the case, no medical knowledge needed.} 2{Whether you\'re seeking care or seeking a case, Denta matches you with the right person, close to home.} 3{Buy, sell, or donate dental tools and equipment within a trusted student community.} other{}}'**
  String onboardingDescription(String page);

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingCreateYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get onboardingCreateYourAccount;

  /// No description provided for @onboardingAlreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get onboardingAlreadyHaveAccount;

  /// No description provided for @onboardingLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get onboardingLogIn;

  /// No description provided for @thisField.
  ///
  /// In en, this message translates to:
  /// **'This field'**
  String get thisField;

  /// No description provided for @nameField.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameField;

  /// No description provided for @phoneNumberField.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberField;

  /// No description provided for @confirmPasswordField.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordField;

  /// No description provided for @fieldRequiredError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} is required'**
  String fieldRequiredError(String fieldName);

  /// No description provided for @fieldMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must be at least {minLength} characters'**
  String fieldMinLengthError(String fieldName, int minLength);

  /// No description provided for @fieldMaxLengthError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must not exceed {maxLength} characters'**
  String fieldMaxLengthError(String fieldName, int maxLength);

  /// No description provided for @nameLettersOnlyError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} can only contain letters, spaces, hyphens, or apostrophes'**
  String nameLettersOnlyError(String fieldName);

  /// No description provided for @emailRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequiredError;

  /// No description provided for @invalidEmailError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmailError;

  /// No description provided for @invalidPhoneError.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid {fieldName}'**
  String invalidPhoneError(String fieldName);

  /// No description provided for @passwordRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequiredError;

  /// No description provided for @passwordMinLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least {minLength} characters'**
  String passwordMinLengthError(int minLength);

  /// No description provided for @passwordUppercaseError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUppercaseError;

  /// No description provided for @passwordLowercaseError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordLowercaseError;

  /// No description provided for @passwordDigitError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordDigitError;

  /// No description provided for @passwordSpecialCharError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get passwordSpecialCharError;

  /// No description provided for @passwordsDoNotMatchError.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatchError;

  /// No description provided for @invalidNumberError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must be a valid number'**
  String invalidNumberError(String fieldName);

  /// No description provided for @numberMinError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must be at least {min}'**
  String numberMinError(String fieldName, num min);

  /// No description provided for @numberMaxError.
  ///
  /// In en, this message translates to:
  /// **'{fieldName} must not exceed {max}'**
  String numberMaxError(String fieldName, num max);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
