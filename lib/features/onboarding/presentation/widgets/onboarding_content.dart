import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/widgets/custom_text_button.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_button.dart';
import 'package:denta/features/onboarding/presentation/widgets/onboarding_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/onboarding_cubit.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, this.currentIndex});

  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          l10n.onboardingTitle(currentIndex.toString()),
          textAlign: TextAlign.center,
          style: context.text.heading2.copyWith(color: context.appColors.white),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.onboardingDescription(currentIndex.toString()),
          textAlign: TextAlign.center,
          style: context.text.captionDefault.copyWith(
            color: context.appColors.white,
          ),
        ),
        const SizedBox(height: 90),
        OnboardingIndicator(currentIndex: currentIndex!),

        const SizedBox(height: 60),

        OnboardingActionButton(
          label: l10n.onboardingExploreDenta,
          isRect: currentIndex == 3 || currentIndex == 0,
          onPressed: () {
            context.read<OnboardingCubit>().gotoNextPage();
          },
        ),
        const SizedBox(height: 28),
        (currentIndex == 0 || currentIndex == 3)
            ? Wrap(
                spacing: 4,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    l10n.onboardingAlreadyHaveAccount,
                    style: context.text.labelDefault.copyWith(
                      color: context.appColors.white,
                    ),
                  ),
                  CustomTextButton(
                    title: l10n.onboardingLogIn,
                    style: context.text.labelDefault.copyWith(
                      color: context.appColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      context.push(RoutePaths.signInPath);
                    },
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
