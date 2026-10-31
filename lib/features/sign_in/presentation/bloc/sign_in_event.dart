part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(SignInRequestParams params) submit,
    required T Function(SignInRequestParams params) updateTextFieldsValues,
    required T Function() rememberMeChanged,
  }) {
    return switch (this) {
      SignInSubmitEvent event => submit(event.params),
      SignInRememberMeChangedEvent() => rememberMeChanged(),
      SignInUpdateTextFieldsValuesEvent event => updateTextFieldsValues(
        event.params,
      ),
    };
  }
}

class SignInSubmitEvent extends SignInEvent {
  final SignInRequestParams params;

  const SignInSubmitEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class SignInRememberMeChangedEvent extends SignInEvent {
  const SignInRememberMeChangedEvent();

  @override
  List<Object> get props => [];
}

class SignInUpdateTextFieldsValuesEvent extends SignInEvent {
  final SignInRequestParams params;

  const SignInUpdateTextFieldsValuesEvent({required this.params});

  @override
  List<Object> get props => [params];
}
