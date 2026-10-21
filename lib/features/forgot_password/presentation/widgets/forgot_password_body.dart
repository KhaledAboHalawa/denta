import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import 'package:denta/features/forgot_password/presentation/widgets/forgot_password_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthAppBar(
          onlyLogo: false,
          onBack: () {
            context.pop();
          },
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.manual,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AuthTextBanner(
                            title: AppLocalizations.of(context)!
                                .forgotPasswordTitle,
                            subTitle: AppLocalizations.of(context)!
                                .forgotPasswordSubTitle,
                          ),
                          const SizedBox(height: 37),
                          const ForgotPasswordForm(),
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
