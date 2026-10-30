import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/auth_divider.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/social_auth_section.dart';
import '../../../../core/widgets/custom_text_button.dart';
import 'sign_in_form.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
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
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AuthTextBanner(
                              title: AppLocalizations.of(context)!.signInTitle,
                              subTitle: AppLocalizations.of(context)!
                                  .signInSubTitle,
                            ),
                            const SizedBox(height: 37),
                            const SignInForm(),
                            const SizedBox(height: 48),
                            AuthDivider(
                              title: AppLocalizations.of(context)!.logIn,
                            ),
                            const SizedBox(height: 24),
                            const SocialAuthSection(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.dontHaveAccount,
                                style: context.text.labelDefault.copyWith(
                                  color: context.appColors.textMain,
                                ),
                              ),
                              CustomTextButton(
                                title: AppLocalizations.of(context)!
                                    .registerCreateAccount,
                                onPressed: () {
                                  context.goNamed(RoutePaths.roleSelectionPath);
                                },
                                color: context.appColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
