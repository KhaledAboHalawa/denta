import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../entities/notification_entity.dart';
import '../repositories/notifications_repository.dart';

@lazySingleton
class MarkNotificationReadUseCase {
  MarkNotificationReadUseCase({required this.repository});
  final NotificationsRepository repository;

  Future<Result<NotificationEntity>> call(int id) => repository.markAsRead(id);
}
