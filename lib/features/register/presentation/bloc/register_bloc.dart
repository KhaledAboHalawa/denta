import 'dart:developer';

import 'package:denta/features/register/domain/entities/register_request_params.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../../../core/di/dependency_injection.dart';

part 'register_event.dart';
part 'register_state.dart';

@lazySingleton
class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc() : super(RegisterState.initial());

  void doIntent(RegisterEvent event) {
    event.when(
      submit: _submit,
      back: _back,
      continueRegister: _continueRegister,
    );
  }

  void _continueRegister(RegisterRequestParams params) {
    log("continueRegister");
    emit(
      state.copyWith(
        params: params.copyWith(
          firstName: params.firstName,
          lastName: params.lastName,
          email: params.email,
        ),
        registerPageIndex: state.registerPageIndex + 1,
        response: const BaseState.loading(),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(response: const BaseState.success(true)));
    });
  }

  void _submit(RegisterRequestParams params) {
    emit(
      state.copyWith(
        params: params.copyWith(
          password: params.password,
          confirmPassword: params.confirmPassword,
        ),
        response: const BaseState.loading(),
      ),
    );
    Future.delayed(const Duration(seconds: 2), () {
      emit(state.copyWith(response: const BaseState.success(true)));
    });
  }

  void _back() {
    if (state.registerPageIndex > 0) {
      emit(state.copyWith(registerPageIndex: state.registerPageIndex - 1));
    }
  }
}

extension GetRegisterBloc on BuildContext {
  RegisterBloc get registerBloc => getIt<RegisterBloc>();
}