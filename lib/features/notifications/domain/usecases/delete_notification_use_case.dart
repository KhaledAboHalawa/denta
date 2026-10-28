import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../repositories/notifications_repository.dart';

@lazySingleton
class DeleteNotificationUseCase {
  DeleteNotificationUseCase({required this.repository});
  final NotificationsRepository repository;

  /// Returns the id of the deleted notification.
  Future<Result<int>> call(int id) => repository.deleteNotification(id);
}
