import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/slide_switcher.dart';
import 'package:denta/features/forgot_password/domain/entities/otp_request_params.dart';
import 'package:denta/features/forgot_password/presentation/widgets/reset_password_success.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';
import 'forgot_password_form.dart';
import 'otp_form.dart';
import 'reset_password_form.dart';

class ProcessWidget extends StatefulWidget {
  const ProcessWidget({super.key});

  @override
  State<ProcessWidget> createState() => _ProcessWidgetState();
}

class _ProcessWidgetState extends State<ProcessWidget> {
  late final ForgotPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ForgotPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.currentPage != current.currentPage,
      builder: (context, state) {
        return SlideSwitcher(
          index: state.currentPage,
          children: [
            const ForgotPasswordForm(),
            OtpForm(
              onCompleted: (code) {
                _cubit.doIntent(
                  ForgotPasswordVerifyOtpEvent(
                    params: OtpRequestParams(
                      email: _cubit.state.emailParams.email,
                      code: code,
                    ),
                  ),
                );
              },
            ),
            const ResetPasswordForm(),
            const ResetPasswordSuccess(),
          ],
        );
      },
    );
  }
}
