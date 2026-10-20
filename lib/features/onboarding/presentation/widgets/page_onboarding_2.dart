import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/utils/app_images.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:denta/features/onboarding/presentation/widgets/onbording_header.dart';
import 'package:flutter/material.dart';

class PageOnboarding2 extends StatelessWidget {
  const PageOnboarding2({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.onLogin,
  });

  final VoidCallback onNext;
  final VoidCallback onSkip;
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
          image: AssetImage(AppImages.onboarding2),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OnboardingHeader(showSkip: true, onSkip: onSkip),
          const Spacer(),
          OnboardingContent(
            title: l10n.onboardingTitle2,
            description: l10n.onboardingDescription2,
            onExplore: onNext,
            onLogin: onLogin,
            showArrowButton: true,
            currentIndex: 1,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
