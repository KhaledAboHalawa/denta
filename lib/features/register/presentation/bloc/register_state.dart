part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.response,
    required this.registerPageIndex,
    required this.params,
    this.selectedRole,
  });

  const RegisterState.initial()
    : this(
        response: const BaseState.initial(),
        registerPageIndex: 0,
        params: const RegisterRequestParams.initial(),
        selectedRole: null,
      );
  final RegisterRequestParams params;
  final UserRole? selectedRole;
  final BaseState<bool> response;
  final int registerPageIndex;

  @override
  List<Object?> get props => [
    response,
    registerPageIndex,
    params,
    selectedRole,
  ];

  RegisterState copyWith({
    BaseState<bool>? response,
    int? registerPageIndex,
    RegisterRequestParams? params,
    UserRole? selectedRole,
  }) {
    return RegisterState(
      response: response ?? this.response,
      registerPageIndex: registerPageIndex ?? this.registerPageIndex,
      params: params ?? this.params,
      selectedRole: selectedRole ?? this.selectedRole,
    );
  }
}
