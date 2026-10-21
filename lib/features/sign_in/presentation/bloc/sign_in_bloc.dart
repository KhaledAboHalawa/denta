import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../domain/entities/sign_in_request_params.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

@lazySingleton
class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState.initial());

  void doIntent(SignInEvent event) {
    event.when(
      submit: _submit,
      rememberMeChanged: _rememberMeChanged,
      updateTextFieldsValues: _updateTextFieldsValues,
    );
  }

  Future<void> _submit(SignInRequestParams params) async {
    emit(state.copyWith(response: const BaseState.loading()));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(response: const BaseState.success(true)));
  }

  void _rememberMeChanged() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }

  void _updateTextFieldsValues(SignInRequestParams params) {
    emit(state.copyWith(params: params));
  }
}
