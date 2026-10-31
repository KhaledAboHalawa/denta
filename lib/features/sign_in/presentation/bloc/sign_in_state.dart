part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  const SignInState({
    required this.response,
    required this.params,
    required this.rememberMe,
  });

  const SignInState.initial()
    : this(
        response: const BaseState.initial(),
        params: const SignInRequestParams.initial(),
        rememberMe: false,
      );
  final SignInRequestParams params;
  final bool rememberMe;
  final BaseState<bool> response;

  @override
  List<Object?> get props => [response, params, rememberMe];

  SignInState copyWith({
    BaseState<bool>? response,
    SignInRequestParams? params,
    bool? rememberMe,
  }) {
    return SignInState(
      response: response ?? this.response,
      params: params ?? this.params,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }
}
