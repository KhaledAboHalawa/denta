import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/dependency_injection.dart';
import '../bloc/forgot_password_bloc.dart';
import '../widgets/forgot_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<ForgotPasswordCubit>(),
        child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state.response.isSuccess) {
              context.push(RoutePaths.otpPath, extra: state.params.email);
            }
          },
          child: const ForgotPasswordBody(),
        ),
      ),
    );
  }
}
