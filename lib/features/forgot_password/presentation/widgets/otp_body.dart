import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';
import 'otp_form.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final email = context.select(
      (ForgotPasswordCubit cubit) => cubit.state.otpParams.email,
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.response.status != current.response.status ||
            previous.resendResponse.status != current.resendResponse.status,
        listener: (context, state) {
          if (state.response.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  (state.response.error?.isNotEmpty ?? false)
                      ? state.response.error!
                      : locale.otpVerificationFailed,
                ),
              ),
            );
          }
          if (state.resendResponse.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.resendResponse.error ?? locale.otpResendFailed,
                ),
              ),
            );
          }
          if (state.resendResponse.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(locale.otpResendMockSuccess)),
            );
          }
        },
        child: Column(
          children: [
            AuthAppBar(
              onlyLogo: false,
              onBack: () {
                context.read<ForgotPasswordCubit>().doIntent(
                  const ForgotPasswordGoToPageEvent(page: 0),
                );
                Navigator.of(context).pop();
              },
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AuthTextBanner(
                              title: locale.otpTitle,
                              subTitle: locale.otpDescription(email),
                            ),
                            const SizedBox(height: 37),
                            const OtpForm(),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
