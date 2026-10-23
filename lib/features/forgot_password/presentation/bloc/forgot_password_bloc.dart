import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../domain/entities/forgot_password_request_params.dart';
import '../../domain/entities/otp_request_params.dart';
import '../../domain/entities/reset_password_request_params.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

@lazySingleton
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordState.initial());

  Timer? _timer;

  void doIntent(ForgotPasswordEvent event) {
    event.when(
      submitEmail: _submitEmail,
      updateEmail: _updateEmail,
      verifyOtp: _verifyOtp,
      resendOtp: _resendOtp,
      submitResetPassword: _submitResetPassword,
      goToPage: _goToPage,
      resetFlow: _resetFlow,
    );
  }

  Future<void> _submitEmail(ForgotPasswordRequestParams params) async {
    emit(state.copyWith(
      emailParams: params,
      response: const BaseState.loading(),
      resendResponse: const BaseState.initial(),
    ));

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 2));
    if (isClosed) return;

    emit(state.copyWith(
      response: const BaseState.success(true),
      currentPage: 1,
      otpParams: OtpRequestParams(email: params.email),
      resendResponse: const BaseState.initial(),
      remainingSeconds: 60,
    ));
    _startTimer();
  }

  void _updateEmail(ForgotPasswordRequestParams params) {
    emit(state.copyWith(emailParams: params));
  }

  Future<void> _verifyOtp(OtpRequestParams params) async {
    if (params.code.length != 4) {
      emit(state.copyWith(response: const BaseState.error('')));
      return;
    }

    emit(state.copyWith(
      response: const BaseState.loading(),
    ));

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 2));
    if (isClosed) return;

    _timer?.cancel();
    emit(state.copyWith(
      response: const BaseState.success(true),
      currentPage: 2,
    ));
  }

  Future<void> _resendOtp() async {
    if (state.remainingSeconds > 0 || state.resendResponse.isLoading) return;

    emit(state.copyWith(resendResponse: const BaseState.loading()));

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 1));
    if (isClosed) return;

    emit(state.copyWith(
      resendResponse: const BaseState.success(true),
      remainingSeconds: 60,
    ));
    _startTimer();
  }

  Future<void> _submitResetPassword(ResetPasswordRequestParams params) async {
    emit(state.copyWith(
      resetPasswordParams: params,
      response: const BaseState.loading(),
    ));

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 1));
    if (isClosed) return;

    emit(state.copyWith(response: const BaseState.success(true)));
  }

  void _resetFlow() {
    _timer?.cancel();
    emit(ForgotPasswordState.initial());
  }

  void _goToPage(int page) {
    if (page < 0 || page > 2) return;
    if (page != 1) _timer?.cancel();
    emit(state.copyWith(
      currentPage: page,
      response: const BaseState.initial(),
    ));
    if (page == 1) {
      emit(state.copyWith(remainingSeconds: 60));
      _startTimer();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isClosed) {
        timer.cancel();
        return;
      }
      if (state.remainingSeconds <= 1) {
        timer.cancel();
        emit(state.copyWith(remainingSeconds: 0));
        return;
      }
      emit(state.copyWith(remainingSeconds: state.remainingSeconds - 1));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
