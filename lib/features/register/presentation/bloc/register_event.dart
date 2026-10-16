part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];

  T when<T>({
    required T Function(RegisterRequestParams params) submit,
    required T Function(RegisterRequestParams params) continueRegister,
    required T Function() back,
  }) {
    return switch (this) {
      RegisterSubmitEvent event => submit(event.params),
      RegisterContinueEvent event => continueRegister(event.params),
      RegisterBackEvent() => back(),
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
  final RegisterRequestParams params;

  const RegisterContinueEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class RegisterBackEvent extends RegisterEvent {}
