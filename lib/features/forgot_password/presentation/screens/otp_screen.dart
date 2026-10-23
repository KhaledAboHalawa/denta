import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../bloc/forgot_password_bloc.dart';
import '../widgets/forgot_password_body.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<ForgotPasswordCubit>()
      ..doIntent(const ForgotPasswordGoToPageEvent(page: 1));

    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(body: SafeArea(child: ForgotPasswordBody())),
    );
  }
}
