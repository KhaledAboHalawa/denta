import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../domain/entities/notification_entity.dart';
import '../bloc/notifications_bloc.dart';
import '../widgets/notifications_body.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({
    super.key,
    this.onNotificationTap,
  });

  /// Integration point for GoRouter once the destination feature routes exist.
  /// The tapped notification already contains [NotificationEntity.targetType]
  /// and [NotificationEntity.targetId].
  final ValueChanged<NotificationEntity>? onNotificationTap;

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late final NotificationsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<NotificationsCubit>()
      ..doIntent(const LoadNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: _cubit,
          child: NotificationsBody(onNotificationTap: widget.onNotificationTap),
        ),
      ),
    );
  }
}
