part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(RegisterRequestParams params) submit,
    required T Function() continueRegister,
    required T Function() back,
    required T Function(UserRole role) setRole,
    required T Function(RegisterRequestParams params) updateTextFieldsValues,
  }) {
    return switch (this) {
      RegisterSubmitEvent event => submit(event.params),
      RegisterContinueEvent() => continueRegister(),
      RegisterBackEvent() => back(),
      RegisterSetRoleEvent event => setRole(event.role),
      RegisterUpdateTextFieldsValuesEvent event => updateTextFieldsValues(
        event.params,
      ),
    };
  }
}

class RegisterSubmitEvent extends RegisterEvent {
  final RegisterRequestParams params;

  const RegisterSubmitEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class RegisterContinueEvent extends RegisterEvent {
  const RegisterContinueEvent();

  @override
  List<Object> get props => [];
}

class RegisterBackEvent extends RegisterEvent {}

class RegisterSetRoleEvent extends RegisterEvent {
  final UserRole role;

  const RegisterSetRoleEvent({required this.role});

  @override
  List<Object> get props => [role];
}

class RegisterUpdateTextFieldsValuesEvent extends RegisterEvent {
  final RegisterRequestParams params;

  const RegisterUpdateTextFieldsValuesEvent({required this.params});

  @override
  List<Object> get props => [params];
}
