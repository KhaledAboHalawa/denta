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

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your Password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubTitle.
  ///
  /// In en, this message translates to:
  /// **'No worries, it happens. Enter your email and we\'ll send you a code to get back in.'**
  String get forgotPasswordSubTitle;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @otpTitle.
  ///
  /// In en, this message translates to:
  /// **'Check Your Email'**
  String get otpTitle;

  /// No description provided for @otpDescription.
  ///
  /// In en, this message translates to:
  /// **'We sent a 4-digit code to {email}. Enter it below to continue.'**
  String otpDescription(String email);

  /// No description provided for @verifyCode.
  ///
  /// In en, this message translates to:
  /// **'Verify Code'**
  String get verifyCode;

  /// No description provided for @didntGetIt.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t get it?'**
  String get didntGetIt;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @otpInvalidCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter the 4-digit code.'**
  String get otpInvalidCode;

  /// No description provided for @otpVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'Code verification failed. Please try again.'**
  String get otpVerificationFailed;

  /// No description provided for @otpResendFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not resend the code. Please try again.'**
  String get otpResendFailed;

  /// No description provided for @otpResendMockSuccess.
  ///
  /// In en, this message translates to:
  /// **'Resend request simulated successfully.'**
  String get otpResendMockSuccess;

  /// No description provided for @otpVerificationMockSuccess.
  ///
  /// In en, this message translates to:
  /// **'Mock verification succeeded. Backend verification is not connected yet.'**
  String get otpVerificationMockSuccess;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Create A New Password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordDescription.
  ///
  /// In en, this message translates to:
  /// **'Make it something you\'ll remember this time.'**
  String get resetPasswordDescription;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @createPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Create password of 8 characters here...'**
  String get createPasswordHint;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter password again'**
  String get confirmPasswordHint;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password.'**
  String get passwordRequired;

  /// No description provided for @passwordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters.'**
  String get passwordMinLength;

  /// No description provided for @confirmPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password.'**
  String get confirmPasswordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwordsDoNotMatch;

  /// No description provided for @resetPasswordSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'You\'re back in!'**
  String get resetPasswordSuccessTitle;

  /// No description provided for @resetPasswordSuccessDescription.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset. Time to pick up where you left off.'**
  String get resetPasswordSuccessDescription;

  /// No description provided for @backToLogin.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

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

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsCasesTab.
  ///
  /// In en, this message translates to:
  /// **'Cases'**
  String get notificationsCasesTab;

  /// No description provided for @notificationsMarketplaceTab.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get notificationsMarketplaceTab;

  /// No description provided for @notificationsToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get notificationsToday;

  /// No description provided for @notificationsEarlier.
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get notificationsEarlier;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All As Read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsEmpty.
  ///
  /// In en, this message translates to:
  /// **'You’re all caught up.'**
  String get notificationsEmpty;

  /// No description provided for @notificationsNewMatchTitle.
  ///
  /// In en, this message translates to:
  /// **'New match found'**
  String get notificationsNewMatchTitle;

  /// No description provided for @notificationsNewMatchDescription.
  ///
  /// In en, this message translates to:
  /// **'A patient near you matches your request.'**
  String get notificationsNewMatchDescription;

  /// No description provided for @notificationsAdjustmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Case needs adjustment'**
  String get notificationsAdjustmentTitle;

  /// No description provided for @notificationsAdjustmentDescription.
  ///
  /// In en, this message translates to:
  /// **'Your request has been waiting for a while, try updating the keywords.'**
  String get notificationsAdjustmentDescription;

  /// No description provided for @notificationsLogSessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Log your session'**
  String get notificationsLogSessionTitle;

  /// No description provided for @notificationsLogSessionDescription.
  ///
  /// In en, this message translates to:
  /// **'How did today’s session go? Add your session notes.'**
  String get notificationsLogSessionDescription;

  /// No description provided for @notificationsAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Appointment confirmed'**
  String get notificationsAppointmentTitle;

  /// No description provided for @notificationsAppointmentDescription.
  ///
  /// In en, this message translates to:
  /// **'Your appointment details are ready to review.'**
  String get notificationsAppointmentDescription;

  /// No description provided for @notificationsReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave a review'**
  String get notificationsReviewTitle;

  /// No description provided for @notificationsReviewDescription.
  ///
  /// In en, this message translates to:
  /// **'Share your experience with the Denta community.'**
  String get notificationsReviewDescription;

  /// No description provided for @notificationsTenMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'10 min ago'**
  String get notificationsTenMinutesAgo;

  /// No description provided for @notificationsYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notificationsYesterday;

  /// No description provided for @notificationsItemReservedTitle.
  ///
  /// In en, this message translates to:
  /// **'Item reserved'**
  String get notificationsItemReservedTitle;

  /// No description provided for @notificationsItemReservedDescription.
  ///
  /// In en, this message translates to:
  /// **'Someone has reserved an item from your listing.'**
  String get notificationsItemReservedDescription;

  /// No description provided for @notificationsPickupTitle.
  ///
  /// In en, this message translates to:
  /// **'Pickup reminder'**
  String get notificationsPickupTitle;

  /// No description provided for @notificationsPickupDescription.
  ///
  /// In en, this message translates to:
  /// **'Remember to arrange a pickup for your reserved item.'**
  String get notificationsPickupDescription;

  /// No description provided for @notificationsItemHandledTitle.
  ///
  /// In en, this message translates to:
  /// **'Item handed over'**
  String get notificationsItemHandledTitle;

  /// No description provided for @notificationsItemHandledDescription.
  ///
  /// In en, this message translates to:
  /// **'Your marketplace handover has been marked complete.'**
  String get notificationsItemHandledDescription;

  /// No description provided for @notificationsMarketplaceUpdateTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace update'**
  String get notificationsMarketplaceUpdateTitle;

  /// No description provided for @notificationsMarketplaceUpdateDescription.
  ///
  /// In en, this message translates to:
  /// **'There is an update related to your marketplace activity.'**
  String get notificationsMarketplaceUpdateDescription;

  /// No description provided for @notificationsEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'New matches and case updates will appear here.'**
  String get notificationsEmptyDescription;
  /// No description provided for @questionnaireStepOf.
  ///
  /// In en, this message translates to:
  /// **'Step {current} of {total}'**
  String questionnaireStepOf(int current, int total);

  /// No description provided for @questionnaireStep1Title.
  ///
  /// In en, this message translates to:
  /// **'Tell Us About Yourself'**
  String get questionnaireStep1Title;

  /// No description provided for @questionnaireStep1Subtitle.
  ///
  /// In en, this message translates to:
  /// **'We\'ll use this to set up your profile and verify you\'re a dental student.'**
  String get questionnaireStep1Subtitle;

  /// No description provided for @questionnaireAllRequired.
  ///
  /// In en, this message translates to:
  /// **'* All fields are required'**
  String get questionnaireAllRequired;

  /// No description provided for @questionnaireFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get questionnaireFullNameLabel;

  /// No description provided for @questionnaireFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get questionnaireFullNameHint;

  /// No description provided for @questionnaireFullNameHelper.
  ///
  /// In en, this message translates to:
  /// **'Please use the name on your university ID.'**
  String get questionnaireFullNameHelper;

  /// No description provided for @questionnaireFullNameTwoWordsError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your first and last name'**
  String get questionnaireFullNameTwoWordsError;

  /// No description provided for @questionnaireUniversityLabel.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get questionnaireUniversityLabel;

  /// No description provided for @questionnaireUniversityHint.
  ///
  /// In en, this message translates to:
  /// **'Search your university'**
  String get questionnaireUniversityHint;

  /// No description provided for @questionnaireAcademicYearLabel.
  ///
  /// In en, this message translates to:
  /// **'Academic year'**
  String get questionnaireAcademicYearLabel;

  /// No description provided for @questionnaireYear1.
  ///
  /// In en, this message translates to:
  /// **'1st'**
  String get questionnaireYear1;

  /// No description provided for @questionnaireYear2.
  ///
  /// In en, this message translates to:
  /// **'2nd'**
  String get questionnaireYear2;

  /// No description provided for @questionnaireYear3.
  ///
  /// In en, this message translates to:
  /// **'3rd'**
  String get questionnaireYear3;

  /// No description provided for @questionnaireYear4.
  ///
  /// In en, this message translates to:
  /// **'4th'**
  String get questionnaireYear4;

  /// No description provided for @questionnaireYear5.
  ///
  /// In en, this message translates to:
  /// **'5th'**
  String get questionnaireYear5;

  /// No description provided for @questionnaireYearIntern.
  ///
  /// In en, this message translates to:
  /// **'Intern'**
  String get questionnaireYearIntern;

  /// No description provided for @questionnaireGovernorateLabel.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get questionnaireGovernorateLabel;

  /// No description provided for @questionnaireGovernorateHint.
  ///
  /// In en, this message translates to:
  /// **'Select your governorate'**
  String get questionnaireGovernorateHint;

  /// No description provided for @questionnaireIdCardLabel.
  ///
  /// In en, this message translates to:
  /// **'University ID card'**
  String get questionnaireIdCardLabel;

  /// No description provided for @questionnaireIdCardUpload.
  ///
  /// In en, this message translates to:
  /// **'Upload your university ID'**
  String get questionnaireIdCardUpload;

  /// No description provided for @questionnaireIdCardNote.
  ///
  /// In en, this message translates to:
  /// **'Used only to verify you\'re a dental student. Never shown publicly.'**
  String get questionnaireIdCardNote;

  /// No description provided for @questionnaireIdCardRequiredError.
  ///
  /// In en, this message translates to:
  /// **'Please upload your university ID'**
  String get questionnaireIdCardRequiredError;

  /// No description provided for @questionnaireSelectError.
  ///
  /// In en, this message translates to:
  /// **'Please select an option'**
  String get questionnaireSelectError;

  /// No description provided for @questionnaireProfilePhotoLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile photo'**
  String get questionnaireProfilePhotoLabel;

  /// No description provided for @questionnaireProfilePhotoAdd.
  ///
  /// In en, this message translates to:
  /// **'Add a profile photo'**
  String get questionnaireProfilePhotoAdd;

  /// No description provided for @questionnaireProfilePhotoChange.
  ///
  /// In en, this message translates to:
  /// **'Change profile photo'**
  String get questionnaireProfilePhotoChange;

  /// No description provided for @questionnaireCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get questionnaireCancel;

  /// No description provided for @questionnaireNextStep.
  ///
  /// In en, this message translates to:
  /// **'Next Step'**
  String get questionnaireNextStep;

  /// No description provided for @questionnaireSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get questionnaireSearchHint;

  /// No description provided for @questionnaireNoResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get questionnaireNoResults;

  /// No description provided for @questionnaireLoadUniversitiesFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load universities. Tap to retry.'**
  String get questionnaireLoadUniversitiesFailed;

  /// No description provided for @questionnaireStep2Title.
  ///
  /// In en, this message translates to:
  /// **'Make Your Profile Stand Out'**
  String get questionnaireStep2Title;

  /// No description provided for @questionnaireStep2Subtitle.
  ///
  /// In en, this message translates to:
  /// **'Patients trust doctors they can learn about. Add these now, or come back anytime!'**
  String get questionnaireStep2Subtitle;

  /// No description provided for @questionnaireBioLabel.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get questionnaireBioLabel;

  /// No description provided for @questionnaireBioHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. 4th-year dental student interested in restorative dentistry, very dedicated to...'**
  String get questionnaireBioHint;

  /// No description provided for @questionnaireCertificationsLabel.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get questionnaireCertificationsLabel;

  /// No description provided for @questionnaireAddCertification.
  ///
  /// In en, this message translates to:
  /// **'Add certification'**
  String get questionnaireAddCertification;

  /// No description provided for @questionnaireCasePhotosLabel.
  ///
  /// In en, this message translates to:
  /// **'Previous cases photos'**
  String get questionnaireCasePhotosLabel;

  /// No description provided for @questionnaireUploadCasePhotos.
  ///
  /// In en, this message translates to:
  /// **'Upload photos of cases you\'ve worked on'**
  String get questionnaireUploadCasePhotos;

  /// No description provided for @questionnairePrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'Only upload photos where the patient can\'t be identified, or who gave consent.'**
  String get questionnairePrivacyNote;

  /// No description provided for @questionnaireSaveAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Save And Continue'**
  String get questionnaireSaveAndContinue;

  /// No description provided for @questionnaireSkipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get questionnaireSkipForNow;

  /// No description provided for @questionnaireTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get questionnaireTakePhoto;

  /// No description provided for @questionnaireChooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get questionnaireChooseFromGallery;

  /// No description provided for @questionnaireDiscardTitle.
  ///
  /// In en, this message translates to:
  /// **'Discard your answers?'**
  String get questionnaireDiscardTitle;

  /// No description provided for @questionnaireDiscardMessage.
  ///
  /// In en, this message translates to:
  /// **'Your progress will be lost.'**
  String get questionnaireDiscardMessage;

  /// No description provided for @questionnaireDiscardConfirm.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get questionnaireDiscardConfirm;

  /// No description provided for @questionnaireKeepEditing.
  ///
  /// In en, this message translates to:
  /// **'Keep editing'**
  String get questionnaireKeepEditing;

  /// No description provided for @questionnaireMaxFilesReached.
  ///
  /// In en, this message translates to:
  /// **'You can add up to {max} files.'**
  String questionnaireMaxFilesReached(int max);
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
