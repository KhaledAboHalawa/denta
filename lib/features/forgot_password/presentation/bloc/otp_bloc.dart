import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../domain/entities/otp_request_params.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@injectable
class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpState.initial());

  Timer? _timer;

  void doIntent(OtpEvent event) {
    event.when(
      initialize: _initialize,
      verify: _verify,
      resend: _resend,
    );
  }

  void _initialize(OtpRequestParams params) {
    _timer?.cancel();

    emit(
      state.copyWith(
        params: params.copyWith(code: ''),
        response: const BaseState.initial(),
        resendResponse: const BaseState.initial(),
        remainingSeconds: 60,
      ),
    );

    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds <= 1) {
        timer.cancel();
        emit(state.copyWith(remainingSeconds: 0));
        return;
      }

      emit(
        state.copyWith(
          remainingSeconds: state.remainingSeconds - 1,
        ),
      );
    });
  }

  Future<void> _verify(OtpRequestParams params) async {
    if (params.code.length != 4) {
      emit(
        state.copyWith(
          response: const BaseState.error(''),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        params: params,
        response: const BaseState.loading(),
      ),
    );

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 2));

    if (isClosed) return;

    emit(
      state.copyWith(
        response: const BaseState.success(true),
      ),
    );
  }

  Future<void> _resend() async {
    if (state.remainingSeconds > 0 ||
        state.resendResponse.isLoading) {
      return;
    }

    emit(
      state.copyWith(
        resendResponse: const BaseState.loading(),
      ),
    );

    // Temporary mock until the backend is ready.
    await Future.delayed(const Duration(seconds: 1));

    if (isClosed) return;

    emit(
      state.copyWith(
        params: state.params.copyWith(code: ''),
        resendResponse: const BaseState.success(true),
        remainingSeconds: 60,
      ),
    );

    _startTimer();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
