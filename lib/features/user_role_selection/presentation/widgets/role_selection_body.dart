import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/auth_app_bar.dart';
import '../../../../core/shared/auth/shared_presentation/widgets/auth_text_banner.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/custom_text_button.dart';
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
                  onPressed: () {
                    context.goNamed(RoutePaths.signInPath);
                  },
                  color: context.appColors.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
