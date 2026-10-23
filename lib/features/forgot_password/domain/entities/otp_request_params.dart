import 'package:equatable/equatable.dart';

class OtpRequestParams extends Equatable {
  final String email;
  final String code;

  const OtpRequestParams({
    this.email = '',
    this.code = '',
  });

  const OtpRequestParams.initial({
    this.email = '',
    this.code = '',
  });

  @override
  List<Object?> get props => [email, code];
}
