import 'package:equatable/equatable.dart';

class ResetPasswordRequestParams extends Equatable {
  final String password;
  final String confirmPassword;

  const ResetPasswordRequestParams({
    this.password = '',
    this.confirmPassword = '',
  });

  const ResetPasswordRequestParams.initial()
      : password = '',
        confirmPassword = '';

  ResetPasswordRequestParams copyWith({
    String? password,
    String? confirmPassword,
  }) {
    return ResetPasswordRequestParams(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object?> get props => [password, confirmPassword];
}
