part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final ForgotPasswordRequestParams emailParams;
  final OtpRequestParams otpParams;
  final ResetPasswordRequestParams resetPasswordParams;
  final BaseState<bool> response;
  final BaseState<bool> resendResponse;
  final int remainingSeconds;
  final int currentPage;

  const ForgotPasswordState({
    required this.emailParams,
    required this.otpParams,
    required this.resetPasswordParams,
    required this.response,
    required this.resendResponse,
    required this.remainingSeconds,
    required this.currentPage,
  });

  const ForgotPasswordState.initial()
    : this(
        emailParams: const ForgotPasswordRequestParams.initial(),
        otpParams: const OtpRequestParams.initial(),
        resetPasswordParams: const ResetPasswordRequestParams.initial(),
        response: const BaseState.initial(),
        resendResponse: const BaseState.initial(),
        remainingSeconds: 60,
        currentPage: 0,
      );

  @override
  List<Object?> get props => [
    emailParams,
    otpParams,
    resetPasswordParams,
    response,
    resendResponse,
    remainingSeconds,
    currentPage,
  ];

  ForgotPasswordState copyWith({
    ForgotPasswordRequestParams? emailParams,
    OtpRequestParams? otpParams,
    ResetPasswordRequestParams? resetPasswordParams,
    BaseState<bool>? response,
    BaseState<bool>? resendResponse,
    int? remainingSeconds,
    int? currentPage,
  }) {
    return ForgotPasswordState(
      emailParams: emailParams ?? this.emailParams,
      otpParams: otpParams ?? this.otpParams,
      resetPasswordParams: resetPasswordParams ?? this.resetPasswordParams,
      response: response ?? this.response,
      resendResponse: resendResponse ?? this.resendResponse,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}
