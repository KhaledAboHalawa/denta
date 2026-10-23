import 'package:equatable/equatable.dart';

class ForgotPasswordRequestParams extends Equatable {
  final String email;

  const ForgotPasswordRequestParams({this.email = ''});

  const ForgotPasswordRequestParams.initial({this.email = ''});

  ForgotPasswordRequestParams copyWith({String? email}) {
    return ForgotPasswordRequestParams(email: email ?? this.email);
  }

  @override
  List<Object?> get props => [email];
}
