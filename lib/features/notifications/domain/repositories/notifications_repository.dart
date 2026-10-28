import '../../../../core/config/base_response/result.dart';
import '../entities/notification_entity.dart';

abstract class NotificationsRepository {
  Future<Result<List<NotificationEntity>>> getNotifications();

  /// Emits notification snapshots whenever the data source receives an update.
  Stream<List<NotificationEntity>> watchNotifications();
  Future<Result<NotificationEntity>> markAsRead(int id);

  /// Deletes a single notification and returns its id on success.
  Future<Result<int>> deleteNotification(int id);
  Future<Result<List<NotificationEntity>>> markAllAsRead({
    NotificationCategory? category,
    bool? isToday,
  });
}
