import 'package:injectable/injectable.dart';

import '../../../../core/config/base_response/result.dart';
import '../../../../core/errors/errors_handler.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_local_data_source.dart';

@LazySingleton(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  NotificationsRepositoryImpl({required this.localDataSource});

  final NotificationsLocalDataSource localDataSource;

  @override
  Future<Result<List<NotificationEntity>>> getNotifications() async {
    try {
      final models = await localDataSource.getNotifications();
      return Result.success(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Result.error(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Stream<List<NotificationEntity>> watchNotifications() =>
      localDataSource.watchNotifications().map(
            (models) => models.map((model) => model.toEntity()).toList(),
          );

  @override
  Future<Result<NotificationEntity>> markAsRead(int id) async {
    try {
      final model = await localDataSource.markAsRead(id);
      if (model == null) {
        return Result.error(Failure(
          statusCode: ApiResponseCode.notFound,
          message: 'Notification not found',
          success: false,
          status: ApiInternalStatus.failure,
        ));
      }
      return Result.success(model.toEntity());
    } catch (error) {
      return Result.error(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Result<int>> deleteNotification(int id) async {
    try {
      final deleted = await localDataSource.deleteNotification(id);
      if (!deleted) {
        return Result.error(Failure(
          statusCode: ApiResponseCode.notFound,
          message: 'Notification not found',
          success: false,
          status: ApiInternalStatus.failure,
        ));
      }
      return Result.success(id);
    } catch (error) {
      return Result.error(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Result<List<NotificationEntity>>> markAllAsRead({
    NotificationCategory? category,
    bool? isToday,
  }) async {
    try {
      final models = await localDataSource.markAllAsRead(
        category: category,
        isToday: isToday,
      );
      return Result.success(models.map((model) => model.toEntity()).toList());
    } catch (error) {
      return Result.error(ErrorHandler.handle(error).failure);
    }
  }
}
