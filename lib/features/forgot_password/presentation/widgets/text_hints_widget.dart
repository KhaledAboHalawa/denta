import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:flutter/widgets.dart';
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
            return AuthTextBanner(
              title: locale.otpTitle,
              subTitle: locale.otpDescription(state.otpParams.email),
            );
          case 2:
            return AuthTextBanner(
              title: locale.resetPasswordTitle,
              subTitle: locale.resetPasswordDescription,
            );
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
