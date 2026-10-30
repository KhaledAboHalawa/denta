import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';

class TextHintsWidget extends StatelessWidget {
  const TextHintsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      buildWhen: (previous, current) =>
          previous.currentPage != current.currentPage ||
          previous.otpParams.email != current.otpParams.email,
      builder: (context, state) {
        switch (state.currentPage) {
          case 1:
            final email = state.emailParams.email;
            final description = locale.otpDescription(email);
            final emailStart = description.indexOf(email);
            if (email.isEmpty || emailStart < 0) {
              return AuthTextBanner(
                title: locale.otpTitle,
                subTitle: description,
              );
            }
            return Column(
              children: [
                Text(
                  locale.otpTitle,
                  textAlign: TextAlign.center,
                  style: context.text.heading1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text.rich(
                  TextSpan(
                    style: context.text.captionDefault,
                    children: [
                      TextSpan(text: description.substring(0, emailStart)),
                      TextSpan(
                        text: email,
                        style: TextStyle(color: context.appColors.primary),
                      ),
                      TextSpan(
                        text: description.substring(emailStart + email.length),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          case 2:
            return AuthTextBanner(
              title: locale.resetPasswordTitle,
              subTitle: locale.resetPasswordDescription,
            );
          case 3:
            return const SizedBox();
          default:
            return AuthTextBanner(
              title: locale.forgotPasswordTitle,
              subTitle: locale.forgotPasswordSubTitle,
            );
        }
      },
    );
  }
}
