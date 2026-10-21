part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(ForgotPasswordRequestParams params) submit,
    required T Function(ForgotPasswordRequestParams params)
        updateTextFieldsValues,
  }) {
    return switch (this) {
      ForgotPasswordSubmitEvent event => submit(event.params),
      ForgotPasswordUpdateTextFieldsValuesEvent event =>
        updateTextFieldsValues(event.params),
    };
  }
}

class ForgotPasswordSubmitEvent extends ForgotPasswordEvent {
  final ForgotPasswordRequestParams params;

  const ForgotPasswordSubmitEvent({required this.params});

  @override
  List<Object> get props => [params];
}

class ForgotPasswordUpdateTextFieldsValuesEvent
    extends ForgotPasswordEvent {
  final ForgotPasswordRequestParams params;

  const ForgotPasswordUpdateTextFieldsValuesEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}
