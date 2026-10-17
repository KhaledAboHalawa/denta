import 'package:flutter/material.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/custom_text_button.dart';
import '../../../presentation/widgets/auth_app_bar.dart';
import '../../../presentation/widgets/auth_text_banner.dart';
import 'role_selection_section.dart';

class RoleSelectionBody extends StatelessWidget {
  const RoleSelectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              children: [
                AuthAppBar(onlyLogo: true),
                AuthTextBanner(
                  title: AppLocalizations.of(context)!.roleSelectionTitle,
                  subTitle: AppLocalizations.of(context)!.roleSelectionSubtitle,
                ),
                const RoleSelectionSection(),
               
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.registerAlreadyHaveAccount,
                  style: context.text.labelDefault,
                ),
                CustomTextButton(
                  title: AppLocalizations.of(context)!.registerSignIn,
                  onPressed:  () {},
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
