import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/utils/app_images.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:denta/features/onboarding/presentation/widgets/onbording_header.dart';
import 'package:flutter/material.dart';

class PageOnboarding1 extends StatelessWidget {
  
  final VoidCallback onNext;
  final VoidCallback onLogin;

  const PageOnboarding1({
    super.key,
    required this.onNext,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.onboarding1),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          OnboardingHeader(showSkip: false, onSkip: () {}),
          Spacer(),
          OnboardingContent(
            title: l10n.onboardingTitle1,
            description: l10n.onboardingDescription1,
            buttonTitle: l10n.onboardingExploreDenta,
            onExplore: onNext,
            onLogin: onLogin,
            showLogin: true,
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
