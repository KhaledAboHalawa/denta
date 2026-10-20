import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/utils/app_images.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:denta/features/onboarding/presentation/widgets/onbording_header.dart';
import 'package:flutter/material.dart';

class PageOnboarding4 extends StatelessWidget {
  const PageOnboarding4({
    super.key,
    required this.onCreateAccount,
    required this.onLogin,
  });

  final VoidCallback onCreateAccount;
  final VoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onboarding4),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingHeader(showSkip: false, onSkip: () {}),
          const Spacer(),
          OnboardingContent(
            title: l10n.onboardingTitle4,
            description: l10n.onboardingDescription4,
            buttonTitle: l10n.onboardingCreateYourAccount,
            onExplore: onCreateAccount,
            onLogin: onLogin,
            showLogin: true,
            currentIndex: 3,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
