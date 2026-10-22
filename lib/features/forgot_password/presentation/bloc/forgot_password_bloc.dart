import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../domain/entities/forgot_password_request_params.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@lazySingleton
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState.initial());

  void doIntent(ForgotPasswordEvent event) {
    event.when(
      submit: _submit,
      updateTextFieldsValues: _updateTextFieldsValues,
    );
  }

  Future<void> _submit(ForgotPasswordRequestParams params) async {
    emit(state.copyWith(params: params, response: const BaseState.loading()));

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(response: const BaseState.success(true)));
  }

  void _updateTextFieldsValues(ForgotPasswordRequestParams params) {
    emit(state.copyWith(params: params));
  }
}
