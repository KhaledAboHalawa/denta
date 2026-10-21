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

  @override
  String get noContentError => 'No content available.';

  @override
  String get badRequestError => 'Bad request. Please check your input.';

  @override
  String get unAuthenticationError =>
      'Authentication failed. Please login again.';

  @override
  String get forbiddenError => 'Access forbidden.';

  @override
  String get internalServerError =>
      'Internal server error. Please try again later.';

  @override
  String get notFoundError => 'Resource not found.';

  @override
  String get conflictError => 'A conflict occurred. Please retry.';

  @override
  String get apiLogicalError => 'API returned a logical error.';

  @override
  String get connectTimeoutError => 'Connection timeout occurred.';

  @override
  String get cancelError => 'Request was cancelled.';

  @override
  String get receiveTimeoutError => 'Receive timeout occurred.';

  @override
  String get sendTimeoutError => 'Send timeout occurred.';

  @override
  String get cacheError => 'Cache error occurred.';

  @override
  String get noInternetConnectionError => 'No internet connection.';

  @override
  String get defaultError => 'An unexpected error occurred.';

  @override
  String get registerFirstNameHint => 'Enter your First name here';

  @override
  String get registerFirstNameLabel => 'First Name';

  @override
  String get registerLastNameHint => 'Enter your Last name here';

  @override
  String get registerLastNameLabel => 'Last Name';

  @override
  String get registerDentistEmailHint => 'yourname@university.edu.eg';

  @override
  String get registerPatientEmailHint => 'Enter your Email here';

  @override
  String get registerDentistEmailLabel => 'University E-mail';

  @override
  String get registerPatientEmailLabel => 'E-mail';

  @override
  String get continueButton => 'Continue';

  @override
  String get registerPasswordHint =>
      'Create Password with at least 8 characters here...';

  @override
  String get registerPasswordLabel => 'Password';

  @override
  String get registerConfirmPasswordHint => 'Confirm your Password here';

  @override
  String get registerConfirmPasswordLabel => 'Confirm Password';

  @override
  String get signInEmailHint => 'Enter your email here';

  @override
  String get signInEmailLabel => 'E-mail';

  @override
  String get signInPasswordHint => 'Enter your password here';

  @override
  String get signInPasswordLabel => 'Password';

  @override
  String get signInTitle => 'Hey, Welcome Back!';

  @override
  String get signInSubTitle => 'Log in to pick up right where you left off.';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get logIn => 'Log In';

  @override
  String get dontHaveAccount => 'Don\'t have an account yet? ';

  @override
  String get registerCreateAccount => 'Create Account';

  @override
  String get registerSubTitle =>
      'Set up your profile and find the right care, nearby.';

  @override
  String get registerDivider => 'Register';

  @override
  String get registerAlreadyHaveAccount => 'Already have an account? ';

  @override
  String get registerSignIn => 'Log In';

  @override
  String get or => 'Or';

  @override
  String get withh => 'with';

  @override
  String get patient => 'I\'m a patient';

  @override
  String get dentist => 'I\'m a dental student';

  @override
  String get patientDesc =>
      'Get affordable, supervised dental care from trusted dental students near you.';

  @override
  String get dentistDesc =>
      'Find clinical cases, get matched with patients nearby, and buy, sell, or donate dental tools.';

  @override
  String get roleSelectionTitle => 'Which One Are You?';

  @override
  String get roleSelectionSubtitle =>
      'This helps us set up the right experience for you.';

  @override
  String get forgotPasswordTitle => 'Forgot Your Password?';

  @override
  String get forgotPasswordSubTitle =>
      'No worries, it happens. Enter your email and we\'ll send you a code to get back in.';
}
