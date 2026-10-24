import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 112,
              height: 112,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.primary.withValues(alpha: 0.08),
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 96,
                    height: 96,
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors.primaryLight.withValues(alpha: 0.65),
                    ),
                    child: SvgPicture.asset(
                      AppIcons.notifications,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.notificationsEmpty,
              textAlign: TextAlign.center,
              style: context.text.labelDefault.copyWith(
                fontSize: 16,
                height: 1.4,
                fontWeight: FontWeight.w600,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.notificationsEmptyDescription,
              textAlign: TextAlign.center,
              style: context.text.captionDefault.copyWith(
                fontSize: 10,
                height: 1.5,
                color: colors.info,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
