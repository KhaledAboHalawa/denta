import 'package:equatable/equatable.dart';


class SignInRequestParams extends Equatable {
  final String email;
  final String password;
 

  const SignInRequestParams({
     this.email = '',
     this.password = '',
  });

  const SignInRequestParams.initial({
    this.email = '',
    this.password = '',
  });

 SignInRequestParams copyWith({
    String? email,
    String? password,
  }) {
    return SignInRequestParams(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
