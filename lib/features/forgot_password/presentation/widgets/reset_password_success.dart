import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordSuccess extends StatelessWidget {
  const ResetPasswordSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 80),
        SvgPicture.asset(AppIcons.celebrationIcon, width: 88, height: 88),
        const SizedBox(height: 28),
        Text(
          locale.resetPasswordSuccessTitle,
          textAlign: TextAlign.center,
          style: context.text.heading2.copyWith(
            color: context.appColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          locale.resetPasswordSuccessDescription,
          textAlign: TextAlign.center,
          style: context.text.captionDefault.copyWith(
            color: context.appColors.info,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            title: locale.backToLogin,
            isLoading: false,
            onPressed: () => context.goNamed(RoutePaths.signInPath),
          ),
        ),
      ],
    );
  }
}
