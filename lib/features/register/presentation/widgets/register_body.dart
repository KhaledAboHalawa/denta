import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/auth/auth_app_bar.dart';
import '../../../../core/widgets/auth/auth_divider.dart';
import '../../../../core/widgets/auth/auth_text_banner.dart';
import '../../../../core/widgets/auth/slide_switcher.dart';
import '../../../../core/widgets/auth/social_auth_section.dart';
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
          const SizedBox(height: 34),
          AuthTextBanner(
            title: AppLocalizations.of(context)!.registerCreateAccount,
            subTitle: AppLocalizations.of(context)!.registerSubTitle,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  padding: const EdgeInsets.only(top: 37, left: 20, right: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight - 37,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
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
                          AuthDivider(title: AppLocalizations.of(context)!.registerDivider),
                          const SizedBox(height: 24),
                          const SocialAuthSection(),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppLocalizations.of(context)!.registerAlreadyHaveAccount),
                              TextButton(
                                onPressed: () {},
                                child: Text(AppLocalizations.of(context)!.registerSignIn),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
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
