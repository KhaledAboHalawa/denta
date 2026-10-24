import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../domain/entities/notification_entity.dart';
import '../models/notification_model.dart';

/// Temporary local source used until the notifications API contract is available.
@lazySingleton
class NotificationsLocalDataSource {
  final StreamController<List<NotificationModel>> _updatesController =
      StreamController<List<NotificationModel>>.broadcast();

  final List<NotificationModel> _notifications = [
    const NotificationModel(id: 0, category: NotificationCategory.cases, kind: NotificationKind.newMatch, targetType: NotificationTargetType.caseDetails, targetId: 'case-101', time: NotificationTime.tenMinutesAgo, isToday: true, isRead: false),
    const NotificationModel(id: 1, category: NotificationCategory.cases, kind: NotificationKind.caseAdjustment, targetType: NotificationTargetType.caseAdjustment, targetId: 'case-102', time: NotificationTime.tenMinutesAgo, isToday: true, isRead: true),
    const NotificationModel(id: 2, category: NotificationCategory.cases, kind: NotificationKind.logSession, targetType: NotificationTargetType.sessionLog, targetId: 'session-201', time: NotificationTime.tenMinutesAgo, isToday: true, isRead: false),
    const NotificationModel(id: 3, category: NotificationCategory.cases, kind: NotificationKind.appointmentConfirmed, targetType: NotificationTargetType.appointmentDetails, targetId: 'appointment-301', time: NotificationTime.oneDayAgo, isToday: false, isRead: true),
    const NotificationModel(id: 4, category: NotificationCategory.cases, kind: NotificationKind.newReview, targetType: NotificationTargetType.reviewDetails, targetId: 'review-401', time: NotificationTime.oneDayAgo, isToday: false, isRead: true),
    const NotificationModel(id: 5, category: NotificationCategory.marketplace, kind: NotificationKind.itemReserved, targetType: NotificationTargetType.marketplaceItemDetails, targetId: 'item-501', time: NotificationTime.tenMinutesAgo, isToday: true, isRead: false),
    const NotificationModel(id: 6, category: NotificationCategory.marketplace, kind: NotificationKind.pickupReminder, targetType: NotificationTargetType.pickupDetails, targetId: 'reservation-502', time: NotificationTime.tenMinutesAgo, isToday: true, isRead: true),
    const NotificationModel(id: 7, category: NotificationCategory.marketplace, kind: NotificationKind.itemHandedOver, targetType: NotificationTargetType.marketplaceItemDetails, targetId: 'item-503', time: NotificationTime.oneDayAgo, isToday: false, isRead: true),
    const NotificationModel(id: 8, category: NotificationCategory.marketplace, kind: NotificationKind.warningIssued, targetType: NotificationTargetType.marketplaceWarningDetails, targetId: 'warning-601', time: NotificationTime.oneDayAgo, isToday: false, isRead: true),
  ];

  Future<List<NotificationModel>> getNotifications() async =>
      List.unmodifiable(_notifications);

  /// Live updates from the local mock source. A remote source can implement
  /// the same contract with WebSocket/SSE events once the backend is ready.
  Stream<List<NotificationModel>> watchNotifications() =>
      _updatesController.stream;

  /// Adds a mock incoming notification for local development/manual testing.
  /// This method is not a replacement for server push notifications.
  void receiveMockNotification(NotificationModel notification) {
    if (_notifications.any((item) => item.id == notification.id)) return;
    _notifications.insert(0, notification);
    _publishUpdate();
  }

  void _publishUpdate() =>
      _updatesController.add(List.unmodifiable(_notifications));

  Future<NotificationModel?> markAsRead(int id) async {
    final index = _notifications.indexWhere((item) => item.id == id);
    if (index == -1) return null;
    _notifications[index] = _notifications[index].copyWith(isRead: true);
    _publishUpdate();
    return _notifications[index];
  }

  Future<List<NotificationModel>> markAllAsRead({
    NotificationCategory? category,
    bool? isToday,
  }) async {
    for (var index = 0; index < _notifications.length; index++) {
      final item = _notifications[index];
      final matchesCategory = category == null || item.category == category;
      final matchesDay = isToday == null || item.isToday == isToday;
      if (matchesCategory && matchesDay) {
        _notifications[index] = item.copyWith(isRead: true);
      }
    }
    _publishUpdate();
    return List.unmodifiable(_notifications);
  }
}
