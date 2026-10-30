import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../entities/notification_entity.dart';
import '../repositories/notifications_repository.dart';

@lazySingleton
class MarkAllNotificationsReadUseCase {
  MarkAllNotificationsReadUseCase({required this.repository});
  final NotificationsRepository repository;

  Future<Result<List<NotificationEntity>>> call({
    NotificationCategory? category,
    bool? isToday,
  }) => repository.markAllAsRead(category: category, isToday: isToday);
}
