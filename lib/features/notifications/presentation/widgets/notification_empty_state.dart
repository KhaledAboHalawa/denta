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

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 101, left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 158,
              height: 160.69,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colors.primary.withValues(alpha: 0.08),
                    ),
                  ),
                  child: SizedBox(
                    width: 148,
                    height: 148,
                    child: Center(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.primaryLight.withValues(alpha: 0.65),
                        ),
                        child: SizedBox(
                          width: 133.76,
                          height: 133.76,
                          child: Center(
                            child: SvgPicture.asset(
                              AppIcons.notifications,
                              width: 84.39,
                              height: 84.39,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.notificationsEmpty,
              textAlign: TextAlign.center,
              style: context.text.heading2.copyWith(color: colors.primary),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.notificationsEmptyDescription,
              textAlign: TextAlign.center,
              style: context.text.labelDefault.copyWith(color: colors.info),
            ),
          ],
        ),
      ),
    );
  }
}
