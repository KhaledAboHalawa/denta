import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/reset_password_bloc.dart';
import '../widgets/reset_password_body.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listenWhen: (previous, current) =>
            previous.response.status != current.response.status,
        listener: (context, state) {
          if (state.response.isSuccess) {
            context.go(RoutePaths.resetPasswordSuccessPath);
          } else if (state.response.isError) {
            final message = state.response.error;
            if (message != null && message.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            }
          }
        },
        child: const Scaffold(
          body: SafeArea(child: ResetPasswordBody()),
        ),
      ),
    );
  }
}
