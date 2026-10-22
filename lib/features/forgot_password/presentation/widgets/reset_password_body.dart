import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'reset_password_form.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Column(
      children: [
        AuthAppBar(
          onlyLogo: false,
          onBack: () => context.pop(),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
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
                            title: locale.resetPasswordTitle,
                            subTitle: locale.resetPasswordDescription,
                          ),
                          const SizedBox(height: 37),
                          const ResetPasswordForm(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
