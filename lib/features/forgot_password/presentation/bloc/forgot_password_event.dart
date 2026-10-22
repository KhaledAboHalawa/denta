part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(ForgotPasswordRequestParams params) submitEmail,
    required T Function(ForgotPasswordRequestParams params) updateEmail,
    required T Function(OtpRequestParams params) verifyOtp,
    required T Function() resendOtp,
    required T Function(OtpRequestParams params) updateOtp,
    required T Function(ResetPasswordRequestParams params) submitResetPassword,
    required T Function(ResetPasswordRequestParams params) updateResetPassword,
    required T Function(int page) goToPage,
    required T Function() resetFlow,
  }) {
    return switch (this) {
      ForgotPasswordSubmitEmailEvent e => submitEmail(e.params),
      ForgotPasswordUpdateEmailEvent e => updateEmail(e.params),
      ForgotPasswordVerifyOtpEvent e => verifyOtp(e.params),
      ForgotPasswordResendOtpEvent() => resendOtp(),
      ForgotPasswordUpdateOtpEvent e => updateOtp(e.params),
      ForgotPasswordSubmitResetPasswordEvent e => submitResetPassword(e.params),
      ForgotPasswordUpdateResetPasswordEvent e => updateResetPassword(e.params),
      ForgotPasswordGoToPageEvent e => goToPage(e.page),
      ForgotPasswordResetFlowEvent() => resetFlow(),
    };
  }
}

class ForgotPasswordSubmitEmailEvent extends ForgotPasswordEvent {
  final ForgotPasswordRequestParams params;
  const ForgotPasswordSubmitEmailEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordUpdateEmailEvent extends ForgotPasswordEvent {
  final ForgotPasswordRequestParams params;
  const ForgotPasswordUpdateEmailEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordVerifyOtpEvent extends ForgotPasswordEvent {
  final OtpRequestParams params;
  const ForgotPasswordVerifyOtpEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordResendOtpEvent extends ForgotPasswordEvent {
  const ForgotPasswordResendOtpEvent();
}

class ForgotPasswordUpdateOtpEvent extends ForgotPasswordEvent {
  final OtpRequestParams params;
  const ForgotPasswordUpdateOtpEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordSubmitResetPasswordEvent extends ForgotPasswordEvent {
  final ResetPasswordRequestParams params;
  const ForgotPasswordSubmitResetPasswordEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordUpdateResetPasswordEvent extends ForgotPasswordEvent {
  final ResetPasswordRequestParams params;
  const ForgotPasswordUpdateResetPasswordEvent({required this.params});
  @override
  List<Object?> get props => [params];
}

class ForgotPasswordGoToPageEvent extends ForgotPasswordEvent {
  final int page;
  const ForgotPasswordGoToPageEvent({required this.page});
  @override
  List<Object?> get props => [page];
}

class ForgotPasswordResetFlowEvent extends ForgotPasswordEvent {
  const ForgotPasswordResetFlowEvent();
}
