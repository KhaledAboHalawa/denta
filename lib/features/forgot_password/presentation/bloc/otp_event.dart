part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(OtpRequestParams params) initialize,
    required T Function(OtpRequestParams params) verify,
    required T Function() resend,
  }) {
    return switch (this) {
      OtpInitializeEvent event => initialize(event.params),
      OtpVerifyEvent event => verify(event.params),
      OtpResendEvent() => resend(),
    };
  }
}

class OtpInitializeEvent extends OtpEvent {
  final OtpRequestParams params;

  const OtpInitializeEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class OtpVerifyEvent extends OtpEvent {
  final OtpRequestParams params;

  const OtpVerifyEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class OtpResendEvent extends OtpEvent {
  const OtpResendEvent();
}
