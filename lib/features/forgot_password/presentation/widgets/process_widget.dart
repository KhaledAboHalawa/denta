import 'package:denta/features/forgot_password/domain/entities/otp_request_params.dart';
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
            return OtpForm(
              onCompleted: (code) {
                final cubit = context.read<ForgotPasswordCubit>();

                cubit.doIntent(
                  ForgotPasswordVerifyOtpEvent(
                    params: OtpRequestParams(
                      email: cubit.state.emailParams.email,
                      code: code,
                    ),
                  ),
                );
              },
            );
          case 2:
            return const ResetPasswordForm();
          default:
            return const ForgotPasswordForm();
        }
      },
    );
  }
}
