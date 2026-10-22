part of 'otp_bloc.dart';

class OtpState extends Equatable {
  final OtpRequestParams params;
  final BaseState<bool> response;
  final BaseState<bool> resendResponse;
  final int remainingSeconds;

  const OtpState({
    required this.params,
    required this.response,
    required this.resendResponse,
    required this.remainingSeconds,
  });

  const OtpState.initial()
      : this(
          params: const OtpRequestParams.initial(),
          response: const BaseState.initial(),
          resendResponse: const BaseState.initial(),
          remainingSeconds: 60,
        );

  @override
  List<Object?> get props => [
        params,
        response,
        resendResponse,
        remainingSeconds,
      ];

  OtpState copyWith({
    OtpRequestParams? params,
    BaseState<bool>? response,
    BaseState<bool>? resendResponse,
    int? remainingSeconds,
  }) {
    return OtpState(
      params: params ?? this.params,
      response: response ?? this.response,
      resendResponse: resendResponse ?? this.resendResponse,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
    );
  }
}
