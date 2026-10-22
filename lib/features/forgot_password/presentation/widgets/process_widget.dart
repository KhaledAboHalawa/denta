import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';
import 'forgot_password_form.dart';
import 'otp_form.dart';
import 'reset_password_form.dart';

class ProcessWidget extends StatelessWidget {
  const ProcessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.currentPage != current.currentPage,
      builder: (context, state) {
        switch (state.currentPage) {
          case 1:
            return const OtpForm();
          case 2:
            return const ResetPasswordForm();
          default:
            return const ForgotPasswordForm();
        }
      },
    );
  }
}
