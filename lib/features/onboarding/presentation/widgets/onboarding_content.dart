import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.onExplore,
    required this.onLogin,
    this.buttonTitle,
    this.showLogin = false,
    this.showArrowButton = false,
    this.currentIndex,
  });

  final String title;
  final String description;
  final String? buttonTitle;
  final VoidCallback onExplore;
  final VoidCallback onLogin;
  final bool showLogin;
  final bool showArrowButton;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.text.heading2.copyWith(color: AppPalette.white),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.text.captionDefault.copyWith(color: AppPalette.white),
        ),
        if (currentIndex != null) ...[
          SizedBox(height: screenHeight * 0.067),
          OnboardingIndicator(currentIndex: currentIndex!),
        ],
        SizedBox(
          height: showArrowButton ? screenHeight * 0.067 : screenHeight * 0.107,
        ),

        if (showArrowButton)
          OnboardingButton(onPressed: onExplore)
        else
          CustomButton(
            isLoading: false,
            title: buttonTitle ?? l10n.onboardingExploreDenta,
            onPressed: onExplore,
          ),
        if (showLogin) ...[
          SizedBox(height: screenHeight * 0.025),
          Wrap(
            spacing: 4,
            alignment: WrapAlignment.center,
            children: [
              Text(
                l10n.onboardingAlreadyHaveAccount,
                style: context.text.labelDefault.copyWith(
                  color: AppPalette.white,
                ),
              ),
              InkWell(
                onTap: onLogin,
                child: Text(
                  l10n.onboardingLogIn,
                  style: context.text.labelDefault.copyWith(
                    color: AppPalette.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
