import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/widgets/custom_button.dart';

class EmptyActiveCaseCard extends StatelessWidget {
  const EmptyActiveCaseCard({super.key, required this.onRequestCase});

  final VoidCallback onRequestCase;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 24,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: colors.dentaGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.35),
            offset: const Offset(0, 3),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset(AppIcons.emptyCaseTooth)),
          const SizedBox(height: 12),
          Text(
            l10n.firstCaseTitle,
            style: context.text.heading2.copyWith(color: colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.firstCaseSubtitle,
            style: context.text.captionDefault.copyWith(color: colors.white),
          ),
          const SizedBox(height: 20),
          CustomButton(
            isLoading: false,
            title: l10n.requestFirstCase,
            onPressed: onRequestCase,
            backgroundColor: colors.white,
            foregroundColor: colors.primary,
            height: 56,
          ),
        ],
      ),
    );
  }
}
