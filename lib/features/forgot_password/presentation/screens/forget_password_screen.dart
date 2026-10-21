import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:denta/features/forgot_password/presentation/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<ForgotPasswordCubit>(),
        child: const ForgotPasswordBody(),
      ),
    );
  }
}
