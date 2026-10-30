import 'package:equatable/equatable.dart';

enum NotificationCategory { cases, marketplace }

enum NotificationKind {
  newMatch,
  caseAdjustment,
  logSession,
  appointmentConfirmed,
  newReview,
  itemReserved,
  pickupReminder,
  itemHandedOver,
  warningIssued,
}

enum NotificationTime { tenMinutesAgo, oneDayAgo }

/// The domain object this notification should open when tapped.
/// Keep this independent from GoRouter so the domain layer stays navigable
/// across API/backend changes.
enum NotificationTargetType {
  caseDetails,
  caseAdjustment,
  sessionLog,
  appointmentDetails,
  reviewDetails,
  marketplaceItemDetails,
  pickupDetails,
  marketplaceWarningDetails,
}

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.category,
    required this.kind,
    required this.time,
    required this.isToday,
    required this.isRead,
    required this.targetType,
    required this.targetId,
  });

  final int id;
  final NotificationCategory category;
  final NotificationKind kind;
  final NotificationTime time;
  final bool isToday;
  final bool isRead;
  final NotificationTargetType targetType;
  /// Identifier of the case, appointment, item, etc. supplied by the backend.
  final String targetId;

  NotificationEntity copyWith({bool? isRead}) => NotificationEntity(
        id: id,
        category: category,
        kind: kind,
        time: time,
        isToday: isToday,
        isRead: isRead ?? this.isRead,
        targetType: targetType,
        targetId: targetId,
      );

  @override
  List<Object?> get props => [id, category, kind, time, isToday, isRead, targetType, targetId];
}
