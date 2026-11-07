import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';
import '../../domain/entities/pending_match_entity.dart';

class MatchStatusLabel extends StatelessWidget {
  const MatchStatusLabel({super.key, required this.status});

  final PendingMatchStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    final (background, foreground, icon, text) = switch (status) {
      PendingMatchStatus.searchingForPatients => (
        colors.secondaryLight,
        colors.primary,
        AppIcons.search,
        l10n.pendingMatchSearching,
      ),
      PendingMatchStatus.needsAdjustments => (
        colors.warningLight,
        colors.warningDark,
        AppIcons.alertCircle,
        l10n.pendingMatchNeedsAdjustments,
      ),
    };

    return Container(
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 7.2),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(2.88),
        border: Border.all(color: foreground, width: 0.4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          SvgPicture.asset(
            icon,
            width: 10,
            height: 10,
            colorFilter: ColorFilter.mode(foreground, BlendMode.srcIn),
          ),
          Text(
            text,
            style: context.text.captionDefault.copyWith(
              fontSize: 10,
              height: 11.52 / 10,
              color: foreground,
            ),
          ),
        ],
      ),
    );
  }
}
