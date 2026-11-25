import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../domain/entities/notification_entity.dart';
import 'notification_section_header.dart';
import 'notification_tile.dart';

/// Shimmering placeholder shown while the notifications load. It reuses the
/// real header and tile so the skeleton has the same shape as the content.
class NotificationsSkeleton extends StatelessWidget {
  const NotificationsSkeleton({super.key});

  static const _kinds = [
    NotificationKind.newMatch,
    NotificationKind.caseAdjustment,
    NotificationKind.logSession,
    NotificationKind.appointmentConfirmed,
    NotificationKind.newReview,
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Skeletonizer(
      // Keep each tile's border; only its texts and icons become bones.
      ignoreContainers: true,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          NotificationSectionHeader(
            title: l10n.notificationsToday,
            action: l10n.notificationsMarkAllRead,
            onTap: () {},
          ),
          const SizedBox(height: 12),
          for (var i = 0; i < _kinds.length; i++)
            NotificationTile(
              notification: NotificationEntity(
                id: i,
                category: NotificationCategory.cases,
                kind: _kinds[i],
                time: NotificationTime.tenMinutesAgo,
                isToday: true,
                isRead: true,
                targetType: NotificationTargetType.caseDetails,
                targetId: '',
              ),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
