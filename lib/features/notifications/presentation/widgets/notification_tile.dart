import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({required this.notification, required this.onTap, super.key});

  final NotificationEntity notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final presentation = _presentation(notification.kind, l10n, colors);
    final isRead = notification.isRead;

    return Material(
      color: isRead ? colors.background : colors.primaryLight.withValues(alpha: 0.55),
      child: InkWell(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 98),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: colors.primaryLight.withValues(alpha: 0.8)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 41,
                height: 41,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: presentation.background, shape: BoxShape.circle),
                child: SvgPicture.asset(
                  presentation.icon,
                  width: 23,
                  height: 23,
                  colorFilter: ColorFilter.mode(presentation.foreground, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(presentation.title, style: context.text.bodyMedium.copyWith(color: colors.textMain)),
                    const SizedBox(height: 4),
                    Text(
                      presentation.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.labelDefault.copyWith(color: colors.info),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      notification.time == NotificationTime.tenMinutesAgo
                          ? l10n.notificationsTenMinutesAgo
                          : l10n.notificationsYesterday,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.end,
                      style: context.text.captionDefault.copyWith(color: colors.info, fontSize: 11),
                    ),
                    if (!isRead) ...[
                      const SizedBox(height: 12),
                      Container(width: 8, height: 8, decoration: BoxDecoration(color: colors.primary, shape: BoxShape.circle)),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _NotificationPresentation _presentation(
    NotificationKind kind,
    AppLocalizations l10n,
    AppColorsExtension colors,
  ) {
    switch (kind) {
      case NotificationKind.newMatch:
        return _NotificationPresentation(l10n.notificationsNewMatchTitle, l10n.notificationsNewMatchDescription, AppIcons.userPlus, colors.primaryLight, colors.primary);
      case NotificationKind.caseAdjustment:
        return _NotificationPresentation(l10n.notificationsAdjustmentTitle, l10n.notificationsAdjustmentDescription, AppIcons.pencil, colors.warning.withValues(alpha: 0.30), colors.warning);
      case NotificationKind.logSession:
        return _NotificationPresentation(l10n.notificationsLogSessionTitle, l10n.notificationsLogSessionDescription, AppIcons.fileSpreadSheet, colors.warning.withValues(alpha: 0.30), colors.warning);
      case NotificationKind.appointmentConfirmed:
        return _NotificationPresentation(l10n.notificationsAppointmentTitle, l10n.notificationsAppointmentDescription, AppIcons.calendar, colors.primaryLight, colors.primary);
      case NotificationKind.newReview:
        return _NotificationPresentation(l10n.notificationsReviewTitle, l10n.notificationsReviewDescription, AppIcons.star, colors.success.withValues(alpha: 0.30), colors.success);
      case NotificationKind.itemReserved:
        return _NotificationPresentation(l10n.notificationsItemReservedTitle, l10n.notificationsItemReservedDescription, AppIcons.store, colors.primaryLight, colors.primary);
      case NotificationKind.pickupReminder:
        return _NotificationPresentation(l10n.notificationsPickupTitle, l10n.notificationsPickupDescription, AppIcons.clock, colors.warning.withValues(alpha: 0.30), colors.warning);
      case NotificationKind.itemHandedOver:
        return _NotificationPresentation(l10n.notificationsItemHandledTitle, l10n.notificationsItemHandledDescription, AppIcons.check, colors.success.withValues(alpha: 0.30), colors.success);
      case NotificationKind.warningIssued:
        return _NotificationPresentation(l10n.notificationsMarketplaceUpdateTitle, l10n.notificationsMarketplaceUpdateDescription, AppIcons.triangleAlert, colors.error.withValues(alpha: 0.28), colors.error);
    }
  }
}

class _NotificationPresentation {
  const _NotificationPresentation(this.title, this.description, this.icon, this.background, this.foreground);
  final String title;
  final String description;
  final String icon;
  final Color background;
  final Color foreground;
}
