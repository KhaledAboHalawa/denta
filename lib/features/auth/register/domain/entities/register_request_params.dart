import 'package:equatable/equatable.dart';

import '../../data/models/register_request_model.dart';

class RegisterRequestParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterRequestParams({
     this.firstName = '',
     this.lastName = '',
     this.email = '',
     this.password = '',
     this.confirmPassword = '',
  });

  const RegisterRequestParams.initial({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

 RegisterRequestParams copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterRequestParams(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  RegisterRequestModel toModel() {
    return RegisterRequestModel(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    password,
    confirmPassword,
  ];
}
