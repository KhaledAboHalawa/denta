import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/otp_request_params.dart';
import '../bloc/forgot_password_bloc.dart';
import '../widgets/otp_body.dart';

class OtpScreen extends StatefulWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final ForgotPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ForgotPasswordCubit>()
      ..doIntent(
        ForgotPasswordUpdateOtpEvent(params: _currentOtpParams(widget.email)),
      )
      ..doIntent(const ForgotPasswordGoToPageEvent(page: 1));
  }

  // Keep any OTP code already entered while restoring the email for this route.
  OtpRequestParams _currentOtpParams(String email) {
    final current = getIt<ForgotPasswordCubit>().state.otpParams;
    return current.copyWith(email: email);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.currentPage == 1 &&
            current.currentPage == 2 &&
            current.response.isSuccess,
        listener: (context, state) {
          context.go(RoutePaths.resetPasswordPath);
        },
        child: const Scaffold(body: SafeArea(child: OtpBody())),
      ),
    );
  }
}
