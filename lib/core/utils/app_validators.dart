class AppValidators {
  AppValidators._();

  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _nameRegex = RegExp(r"^[\p{L}\s'-]+$", unicode: true);

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
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateName(
    String? value, {
    String fieldName = 'Name',
    int minLength = 2,
    int maxLength = 50,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final trimmed = value.trim();

    if (trimmed.length < minLength) {
      return '$fieldName must be at least $minLength characters';
    }

    if (trimmed.length > maxLength) {
      return '$fieldName must not exceed $maxLength characters';
    }

    if (!_nameRegex.hasMatch(trimmed)) {
      return '$fieldName can only contain letters, spaces, hyphens, or apostrophes';
    }

    return null;
  }

  static String? validateEmail(String? value, {String? customErrorMessage}) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmed = value.trim();

    if (!_emailRegex.hasMatch(trimmed)) {
      return customErrorMessage ?? 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePhone(
    String? value, {
    String fieldName = 'Phone number',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final trimmed = value.trim();

    if (!_phoneRegex.hasMatch(trimmed)) {
      return 'Please enter a valid $fieldName';
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
  }) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    if (requireUppercase && !_hasUppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (requireLowercase && !_hasLowercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    if (requireDigit && !_hasDigitRegex.hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    if (requireSpecialChar && !_hasSpecialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword, {
    String fieldName = 'Confirm Password',
  }) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateNumber(
    String? value, {
    String fieldName = 'This field',
    num? min,
    num? max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    final trimmed = value.trim();
    final number = num.tryParse(trimmed);

    if (number == null || !_numericRegex.hasMatch(trimmed)) {
      return '$fieldName must be a valid number';
    }

    if (min != null && number < min) {
      return '$fieldName must be at least $min';
    }

    if (max != null && number > max) {
      return '$fieldName must not exceed $max';
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
  ///     (val) => AppValidators.validateRequired(val, fieldName: 'Email'),
  ///     AppValidators.validateEmail,
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
