import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../domain/entities/reset_password_request_params.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState.initial());

  void doIntent(ResetPasswordEvent event) {
    event.when(
      submit: _submit,
      updateTextFieldsValues: _updateTextFieldsValues,
    );
  }

  Future<void> _submit(ResetPasswordRequestParams params) async {
    emit(
      state.copyWith(
        params: params,
        response: const BaseState.loading(),
      ),
    );

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 1));

    if (isClosed) return;

    emit(state.copyWith(response: const BaseState.success(true)));
  }

  void _updateTextFieldsValues(ResetPasswordRequestParams params) {
    emit(state.copyWith(params: params));
  }
}
