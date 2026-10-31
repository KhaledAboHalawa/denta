import '../../domain/entities/notification_entity.dart';

class NotificationModel {
  const NotificationModel({
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
  final String targetId;

  NotificationModel copyWith({bool? isRead}) => NotificationModel(
    id: id,
    category: category,
    kind: kind,
    time: time,
    isToday: isToday,
    isRead: isRead ?? this.isRead,
    targetType: targetType,
    targetId: targetId,
  );

  NotificationEntity toEntity() => NotificationEntity(
    id: id,
    category: category,
    kind: kind,
    time: time,
    isToday: isToday,
    isRead: isRead,
    targetType: targetType,
    targetId: targetId,
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'] as int,
        category: NotificationCategory.values.byName(
          json['category'] as String,
        ),
        kind: NotificationKind.values.byName(json['kind'] as String),
        time: NotificationTime.values.byName(json['time'] as String),
        isToday: json['isToday'] as bool? ?? false,
        isRead: json['isRead'] as bool? ?? false,
        targetType: NotificationTargetType.values.byName(
          json['targetType'] as String? ?? 'caseDetails',
        ),
        targetId: json['targetId']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category.name,
    'kind': kind.name,
    'time': time.name,
    'isToday': isToday,
    'isRead': isRead,
    'targetType': targetType.name,
    'targetId': targetId,
  };
}
