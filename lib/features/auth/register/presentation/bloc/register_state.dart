part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.response,
    required this.registerPageIndex,
    required this.params,
  });

  const RegisterState.initial()
    : this(
        response: const BaseState.initial(),
        registerPageIndex: 0,
        params: const RegisterRequestParams.initial(),
      );
  final RegisterRequestParams params;
  final BaseState<bool> response;
  final int registerPageIndex;

  @override
  List<Object?> get props => [params, response, registerPageIndex];

  RegisterState copyWith({
    BaseState<bool>? response,
    int? registerPageIndex,
    RegisterRequestParams? params,
  }) {
    return RegisterState(
      params: params ?? this.params,
      response: response ?? this.response,
      registerPageIndex: registerPageIndex ?? this.registerPageIndex,
    );
  }

}
