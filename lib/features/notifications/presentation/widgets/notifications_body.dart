import 'package:denta/core/shared/auth/shared_presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/base_state/base_state.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/notification_entity.dart';
import '../bloc/notifications_bloc.dart';
import 'notification_empty_state.dart';
import 'notification_section_header.dart';
import 'notification_tab.dart';
import 'notification_tile.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key, this.onNotificationTap});

  /// Called after a notification is marked as read. Connect this callback to
  /// the app's destination routes when case/marketplace detail routes are ready.
  final ValueChanged<NotificationEntity>? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        final colors = context.appColors;
        final cubit = context.read<NotificationsCubit>();
        final category = state.selectedCategory;
        final allItems = state.response.data ?? const <NotificationEntity>[];
        final items = allItems
            .where((item) => item.category == category)
            .toList();
        final today = items.where((item) => item.isToday).toList();
        final earlier = items.where((item) => !item.isToday).toList();

        return Column(
          children: [
            CustomAppBar(title: l10n.notificationsTitle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NotificationTab(
                          title: l10n.notificationsCasesTab,
                          selected: category == NotificationCategory.cases,
                          onTap: () => cubit.doIntent(
                            const SelectNotificationCategoryEvent(
                              NotificationCategory.cases,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: NotificationTab(
                          title: l10n.notificationsMarketplaceTab,
                          selected:
                              category == NotificationCategory.marketplace,
                          onTap: () => cubit.doIntent(
                            const SelectNotificationCategoryEvent(
                              NotificationCategory.marketplace,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: colors.info.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Align(
                        alignment: category == NotificationCategory.cases
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Container(
                            height: 2,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: state.response.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.response.isError
                  ? Center(
                      child: Text(
                        state.response.error ?? l10n.notificationsEmpty,
                        style: context.text.bodyMedium.copyWith(
                          color: colors.info,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : items.isEmpty
                  ? const NotificationEmptyState()
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        NotificationSectionHeader(
                          title: l10n.notificationsToday,
                          action: l10n.notificationsMarkAllRead,
                          onTap: () => cubit.doIntent(
                            MarkAllNotificationsAsReadEvent(
                              category: category,
                              isToday: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...today.map(
                          (item) => NotificationTile(
                            notification: item,
                            onTap: () => _handleNotificationTap(cubit, item),
                          ),
                        ),
                        const SizedBox(height: 12),
                        NotificationSectionHeader(
                          title: l10n.notificationsEarlier,
                          action: l10n.notificationsMarkAllRead,
                          onTap: () => cubit.doIntent(
                            MarkAllNotificationsAsReadEvent(
                              category: category,
                              isToday: false,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...earlier.map(
                          (item) => NotificationTile(
                            notification: item,
                            onTap: () => _handleNotificationTap(cubit, item),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }

  void _handleNotificationTap(
    NotificationsCubit cubit,
    NotificationEntity notification,
  ) {
    cubit.doIntent(MarkNotificationAsReadEvent(notification.id));
    // Navigation is intentionally injected: the project currently has no
    // case/appointment/marketplace detail routes to navigate to yet.
    onNotificationTap?.call(notification);
  }
}
