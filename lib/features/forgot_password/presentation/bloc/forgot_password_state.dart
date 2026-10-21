part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({required this.response, required this.params});

  const ForgotPasswordState.initial()
    : this(
        response: const BaseState.initial(),
        params: const ForgotPasswordRequestParams.initial(),
      );

  final ForgotPasswordRequestParams params;
  final BaseState<bool> response;

  @override
  List<Object?> get props => [response, params];

  ForgotPasswordState copyWith({
    BaseState<bool>? response,
    ForgotPasswordRequestParams? params,
  }) {
    return ForgotPasswordState(
      response: response ?? this.response,
      params: params ?? this.params,
    );
  }
}
