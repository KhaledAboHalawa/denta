part of 'reset_password_bloc.dart';

sealed class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function(ResetPasswordRequestParams params) submit,
    required T Function(ResetPasswordRequestParams params)
        updateTextFieldsValues,
  }) {
    return switch (this) {
      ResetPasswordSubmitEvent event => submit(event.params),
      ResetPasswordUpdateTextFieldsValuesEvent event =>
        updateTextFieldsValues(event.params),
    };
  }
}

class ResetPasswordSubmitEvent extends ResetPasswordEvent {
  final ResetPasswordRequestParams params;

  const ResetPasswordSubmitEvent({required this.params});

  @override
  List<Object?> get props => [params];
}

class ResetPasswordUpdateTextFieldsValuesEvent extends ResetPasswordEvent {
  final ResetPasswordRequestParams params;

  const ResetPasswordUpdateTextFieldsValuesEvent({required this.params});

  @override
  List<Object?> get props => [params];
}
