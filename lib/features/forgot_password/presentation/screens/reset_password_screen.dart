import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/forgot_password_bloc.dart';
import '../widgets/forgot_password_body.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ForgotPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ForgotPasswordCubit>()
      ..doIntent(const ForgotPasswordGoToPageEvent(page: 2));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.currentPage == 2 &&
            previous.response.status != current.response.status &&
            current.response.isSuccess,
        listener: (context, state) {
          context.go(RoutePaths.resetPasswordSuccessPath);
        },
        child: const Scaffold(
          body: SafeArea(child: ForgotPasswordBody()),
        ),
      ),
    );
  }
}
