import 'package:flutter/widgets.dart';

import '../di/dependency_injection.dart';
import '../l10n/app_localizations.dart';
import '../localization/locale_cubit.dart';

class AppValidators {
  AppValidators._();

  static AppLocalizations _getL10n({
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    if (l10n != null) return l10n;
    if (context != null) {
      final loc = AppLocalizations.of(context);
      if (loc != null) return loc;
    }
    if (getIt.isRegistered<LocaleCubit>()) {
      return lookupAppLocalizations(getIt<LocaleCubit>().state);
    }
    return lookupAppLocalizations(const Locale('en'));
  }

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _nameRegex = RegExp(r"^[\p{L}\s'-]+$", unicode: true);
  static final RegExp _twoWordsRegex = RegExp(r'\s+');
  static final RegExp _phoneRegex = RegExp(r'^\+?[0-9\s\-()]{8,15}$');

  static final RegExp _hasUppercaseRegex = RegExp(r'[A-Z]');
  static final RegExp _hasLowercaseRegex = RegExp(r'[a-z]');
  static final RegExp _hasDigitRegex = RegExp(r'[0-9]');
  static final RegExp _hasSpecialCharRegex = RegExp(
    r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\/`~]',
  );
  static final RegExp _numericRegex = RegExp(r'^-?[0-9]+(\.[0-9]+)?$');

  static String? validateRequired(
    String? value, {
    String? fieldName,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    if (value == null || value.trim().isEmpty) {
      final localizations = _getL10n(context: context, l10n: l10n);
      return localizations.fieldRequiredError(
        fieldName ?? localizations.thisField,
      );
    }
    return null;
  }

  static String? validateFullName(
    String? value, {
    String? fieldName,
    int minLength = 2,
    int maxLength = 50,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);
    final name = fieldName ?? localizations.nameField;

    if (value == null || value.trim().isEmpty) {
      return localizations.fieldRequiredError(name);
    }

    final trimmed = value.trim();

    if (trimmed.split(_twoWordsRegex).length < 2) {
      return localizations.questionnaireFullNameTwoWordsError;
    }

    if (trimmed.length < minLength) {
      return localizations.fieldMinLengthError(name, minLength);
    }

    if (trimmed.length > maxLength) {
      return localizations.fieldMaxLengthError(name, maxLength);
    }

    if (!_nameRegex.hasMatch(trimmed)) {
      return localizations.nameLettersOnlyError(name);
    }

    return null;
  }

  static String? validateName(
    String? value, {
    String? fieldName,
    int minLength = 2,
    int maxLength = 50,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);
    final name = fieldName ?? localizations.questionnaireFullNameLabel;

    if (value == null || value.trim().isEmpty) {
      return localizations.fieldRequiredError(name);
    }

    final trimmed = value.trim();

    if (trimmed.length < minLength) {
      return localizations.fieldMinLengthError(name, minLength);
    }

    if (trimmed.length > maxLength) {
      return localizations.fieldMaxLengthError(name, maxLength);
    }

    if (!_nameRegex.hasMatch(trimmed)) {
      return localizations.nameLettersOnlyError(name);
    }

    return null;
  }

  static String? validateEmail(
    String? value, {
    String? customErrorMessage,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);

    if (value == null || value.trim().isEmpty) {
      return localizations.emailRequiredError;
    }

    final trimmed = value.trim();

    if (!_emailRegex.hasMatch(trimmed)) {
      return customErrorMessage ?? localizations.invalidEmailError;
    }

    return null;
  }

  static String? validatePhone(
    String? value, {
    String? fieldName,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);
    final name = fieldName ?? localizations.phoneNumberField;

    if (value == null || value.trim().isEmpty) {
      return localizations.fieldRequiredError(name);
    }

    final trimmed = value.trim();

    if (!_phoneRegex.hasMatch(trimmed)) {
      return localizations.invalidPhoneError(name);
    }

    return null;
  }

  static String? validatePassword(
    String? value, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireDigit = true,
    bool requireSpecialChar = false,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);

    if (value == null || value.isEmpty) {
      return localizations.passwordRequiredError;
    }

    if (value.length < minLength) {
      return localizations.passwordMinLengthError(minLength);
    }

    if (requireUppercase && !_hasUppercaseRegex.hasMatch(value)) {
      return localizations.passwordUppercaseError;
    }

    if (requireLowercase && !_hasLowercaseRegex.hasMatch(value)) {
      return localizations.passwordLowercaseError;
    }

    if (requireDigit && !_hasDigitRegex.hasMatch(value)) {
      return localizations.passwordDigitError;
    }

    if (requireSpecialChar && !_hasSpecialCharRegex.hasMatch(value)) {
      return localizations.passwordSpecialCharError;
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword, {
    String? fieldName,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);
    final name = fieldName ?? localizations.confirmPasswordField;

    if (value == null || value.isEmpty) {
      return localizations.fieldRequiredError(name);
    }

    if (value != originalPassword) {
      return localizations.passwordsDoNotMatchError;
    }

    return null;
  }

  static String? validateNumber(
    String? value, {
    String? fieldName,
    num? min,
    num? max,
    BuildContext? context,
    AppLocalizations? l10n,
  }) {
    final localizations = _getL10n(context: context, l10n: l10n);
    final name = fieldName ?? localizations.thisField;

    if (value == null || value.trim().isEmpty) {
      return localizations.fieldRequiredError(name);
    }

    final trimmed = value.trim();
    final number = num.tryParse(trimmed);

    if (number == null || !_numericRegex.hasMatch(trimmed)) {
      return localizations.invalidNumberError(name);
    }

    if (min != null && number < min) {
      return localizations.numberMinError(name, min);
    }

    if (max != null && number > max) {
      return localizations.numberMaxError(name, max);
    }

    return null;
  }

  // ---------------------------------------------------------------------------
  // Validator Combiner
  // ---------------------------------------------------------------------------

  /// Combines multiple validators into one, running sequentially until the first error.
  ///
  /// ```dart
  /// TextFormField(
  ///   validator: AppValidators.combine([
  ///     (val) => AppValidators.validateRequired(val, context: context, fieldName: 'Email'),
  ///     (val) => AppValidators.validateEmail(val, context: context),
  ///   ]),
  /// )
  /// ```
  static String? Function(String?) combine(
    List<String? Function(String?)> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }
      return null;
    };
  }

  // ---------------------------------------------------------------------------
  // Boolean Helpers (For reactive UI, form state, and button enabling)
  // ---------------------------------------------------------------------------

  static bool isEmailValid(String? value) {
    if (value == null) {
      return false;
    }
    return _emailRegex.hasMatch(value.trim());
  }

  static bool isPhoneValid(String? value) {
    if (value == null) {
      return false;
    }
    return _phoneRegex.hasMatch(value.trim());
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return _numericRegex.hasMatch(value.trim());
  }

  static bool isPasswordStrong(
    String? value, {
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireDigit = true,
    bool requireSpecialChar = false,
  }) {
    if (value == null || value.length < minLength) {
      return false;
    }
    if (requireUppercase && !_hasUppercaseRegex.hasMatch(value)) {
      return false;
    }
    if (requireLowercase && !_hasLowercaseRegex.hasMatch(value)) {
      return false;
    }
    if (requireDigit && !_hasDigitRegex.hasMatch(value)) {
      return false;
    }
    if (requireSpecialChar && !_hasSpecialCharRegex.hasMatch(value)) {
      return false;
    }
    return true;
  }
}
