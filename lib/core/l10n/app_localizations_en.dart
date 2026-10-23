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

  @override
  String get sendCode => 'Send Code';

  @override
  String get otpTitle => 'Check Your Email';

  @override
  String otpDescription(String email) {
    return 'We sent a 4-digit code to $email. Enter it below to continue.';
  }

  @override
  String get verifyCode => 'Verify Code';

  @override
  String get didntGetIt => 'Didn\'t get it?';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get otpInvalidCode => 'Please enter the 4-digit code.';

  @override
  String get otpVerificationFailed =>
      'Code verification failed. Please try again.';

  @override
  String get otpResendFailed => 'Could not resend the code. Please try again.';

  @override
  String get otpResendMockSuccess => 'Resend request simulated successfully.';

  @override
  String get otpVerificationMockSuccess =>
      'Mock verification succeeded. Backend verification is not connected yet.';

  @override
  String get resetPasswordTitle => 'Create A New Password';

  @override
  String get resetPasswordDescription =>
      'Make it something you\'ll remember this time.';

  @override
  String get newPassword => 'New Password';

  @override
  String get createPasswordHint => 'Create password of 8 characters here...';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Enter password again';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get passwordRequired => 'Please enter a password.';

  @override
  String get passwordMinLength => 'Password must be at least 8 characters.';

  @override
  String get confirmPasswordRequired => 'Please confirm your password.';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match.';

  @override
  String get resetPasswordSuccessTitle => 'You\'re back in!';

  @override
  String get resetPasswordSuccessDescription =>
      'Your password has been reset. Time to pick up where you left off.';

  @override
  String get backToLogin => 'Back to Login';

  @override
  String get onboardingExploreDenta => 'Explore Denta';

  @override
  String onboardingTitle(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'Where Dental Care Meets Dental Learning',
      '1': 'Not Sure What\'s Wrong? We\'ll Help You Find Out',
      '2': 'Matched Nearby, Matched Right',
      '3': 'More Than Just Cases',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String onboardingDescription(String page) {
    String _temp0 = intl.Intl.selectLogic(page, {
      '0': 'Denta connects dental students and patients, making treatment more accessible and clinical training more efficient.',
      '1': 'Snap a photo of your concern, and our AI helps identify the case, no medical knowledge needed.',
      '2': 'Whether you\'re seeking care or seeking a case, Denta matches you with the right person, close to home.',
      '3': 'Buy, sell, or donate dental tools and equipment within a trusted student community.',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get onboardingSkip => 'skip';

  @override
  String get onboardingCreateYourAccount => 'Create Your Account';

  @override
  String get onboardingAlreadyHaveAccount => 'Already have an account? ';

  @override
  String get onboardingLogIn => 'Log In';

  @override
  String get thisField => 'This field';

  @override
  String get nameField => 'Name';

  @override
  String get phoneNumberField => 'Phone number';

  @override
  String get confirmPasswordField => 'Confirm Password';

  @override
  String fieldRequiredError(String fieldName) {
    return '$fieldName is required';
  }

  @override
  String fieldMinLengthError(String fieldName, int minLength) {
    return '$fieldName must be at least $minLength characters';
  }

  @override
  String fieldMaxLengthError(String fieldName, int maxLength) {
    return '$fieldName must not exceed $maxLength characters';
  }

  @override
  String nameLettersOnlyError(String fieldName) {
    return '$fieldName can only contain letters, spaces, hyphens, or apostrophes';
  }

  @override
  String get emailRequiredError => 'Email is required';

  @override
  String get invalidEmailError => 'Please enter a valid email address';

  @override
  String invalidPhoneError(String fieldName) {
    return 'Please enter a valid $fieldName';
  }

  @override
  String get passwordRequiredError => 'Password is required';

  @override
  String passwordMinLengthError(int minLength) {
    return 'Password must be at least $minLength characters';
  }

  @override
  String get passwordUppercaseError =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordLowercaseError =>
      'Password must contain at least one lowercase letter';

  @override
  String get passwordDigitError => 'Password must contain at least one number';

  @override
  String get passwordSpecialCharError =>
      'Password must contain at least one special character';

  @override
  String get passwordsDoNotMatchError => 'Passwords do not match';

  @override
  String invalidNumberError(String fieldName) {
    return '$fieldName must be a valid number';
  }

  @override
  String numberMinError(String fieldName, num min) {
    return '$fieldName must be at least $min';
  }

  @override
  String numberMaxError(String fieldName, num max) {
    return '$fieldName must not exceed $max';
  }
}
