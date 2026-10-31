import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    super.key,
    required this.showSkip,
    required this.onSkip,
  });

  final bool showSkip;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: .only(
        top: MediaQuery.of(context).padding.top,
        right: 10,
        left: 10,
      ),
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: .none,
        children: [
          if (showSkip)
            GestureDetector(
              onTap: onSkip,
              child: Row(
                crossAxisAlignment: .end,
                mainAxisAlignment: .end,
                children: [
                  const SizedBox(height: 40),
                  Text(
                    l10n.onboardingSkip,
                    style: context.text.bodyLarge.copyWith(
                      color: context.appColors.white,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    key: const ValueKey('icon'),
                    size: 25,
                    color: context.appColors.white,
                  ),
                ],
              ),
            ),
          Image.asset(AppImages.logoDark, height: 57),
        ],
      ),
    );
  }
}
