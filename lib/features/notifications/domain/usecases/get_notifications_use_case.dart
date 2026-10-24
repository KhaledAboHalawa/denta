import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../entities/notification_entity.dart';
import '../repositories/notifications_repository.dart';

@lazySingleton
class GetNotificationsUseCase {
  GetNotificationsUseCase({required this.repository});
  final NotificationsRepository repository;

  Future<Result<List<NotificationEntity>>> call() => repository.getNotifications();

  Stream<List<NotificationEntity>> watch() => repository.watchNotifications();
}
