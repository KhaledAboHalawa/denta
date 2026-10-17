import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../presentation/widgets/auth_app_bar.dart';
import '../../../presentation/widgets/auth_divider.dart';
import '../../../presentation/widgets/auth_text_banner.dart';
import '../../../presentation/widgets/slide_switcher.dart';
import '../../../presentation/widgets/social_auth_section.dart';
import '../bloc/register_bloc.dart';
import 'first_register_form.dart';
import 'second_register_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 35),
          AuthAppBar(
            onlyLogo: false,
            onBack: () {
              context.read<RegisterBloc>().doIntent(RegisterBackEvent());
            },
          ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  padding: const EdgeInsets.only(top: 34, left: 20, right: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 34,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AuthTextBanner(
                              title: AppLocalizations.of(context)!
                                  .registerCreateAccount,
                              subTitle: AppLocalizations.of(context)!
                                  .registerSubTitle,
                            ),
                            const SizedBox(height: 37),
                            BlocBuilder<RegisterBloc, RegisterState>(
                              buildWhen: (prev, curr) =>
                                  prev.registerPageIndex !=
                                  curr.registerPageIndex,
                              builder: (context, state) {
                                return SlideSwitcher(
                                  index: state.registerPageIndex,
                                  children: [
                                    const FirstRegisterForm(
                                      key: ValueKey('first'),
                                    ),
                                    const SecondRegisterForm(
                                      key: ValueKey('second'),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const SizedBox(height: 48),
                            AuthDivider(
                              title: AppLocalizations.of(context)!
                                  .registerDivider,
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
                                AppLocalizations.of(context)!
                                    .registerAlreadyHaveAccount,
                                style: context.text.labelDefault,
                              ),
                              CustomTextButton(
                                title: AppLocalizations.of(context)!
                                    .registerSignIn,
                                onPressed: () {},
                                color: Theme.of(context).colorScheme.primary,
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
