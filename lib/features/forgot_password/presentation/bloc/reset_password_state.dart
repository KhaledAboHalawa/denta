part of 'reset_password_bloc.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    required this.response,
    required this.params,
  });

  const ResetPasswordState.initial()
      : this(
          response: const BaseState.initial(),
          params: const ResetPasswordRequestParams.initial(),
        );

  final ResetPasswordRequestParams params;
  final BaseState<bool> response;

  @override
  List<Object?> get props => [response, params];

  ResetPasswordState copyWith({
    BaseState<bool>? response,
    ResetPasswordRequestParams? params,
  }) {
    return ResetPasswordState(
      response: response ?? this.response,
      params: params ?? this.params,
    );
  }
}
