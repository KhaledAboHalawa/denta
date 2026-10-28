part of 'notifications_bloc.dart';

sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function() load,
    required T Function(NotificationCategory category) selectCategory,
    required T Function(int id) markAsRead,
    required T Function(NotificationCategory category, bool isToday) markAllAsRead,
    required T Function(int id) deleteNotification,
  }) => switch (this) {
    LoadNotificationsEvent() => load(),
    SelectNotificationCategoryEvent event => selectCategory(event.category),
    MarkNotificationAsReadEvent event => markAsRead(event.id),
    MarkAllNotificationsAsReadEvent event => markAllAsRead(event.category, event.isToday),
    DeleteNotificationEvent event => deleteNotification(event.id),
  };
}

class LoadNotificationsEvent extends NotificationsEvent {
  const LoadNotificationsEvent();
}

class SelectNotificationCategoryEvent extends NotificationsEvent {
  const SelectNotificationCategoryEvent(this.category);
  final NotificationCategory category;
  @override
  List<Object?> get props => [category];
}

class MarkNotificationAsReadEvent extends NotificationsEvent {
  const MarkNotificationAsReadEvent(this.id);
  final int id;
  @override
  List<Object?> get props => [id];
}

class MarkAllNotificationsAsReadEvent extends NotificationsEvent {
  const MarkAllNotificationsAsReadEvent({required this.category, required this.isToday});
  final NotificationCategory category;
  final bool isToday;
  @override
  List<Object?> get props => [category, isToday];
}

class DeleteNotificationEvent extends NotificationsEvent {
  const DeleteNotificationEvent(this.id);
  final int id;
  @override
  List<Object?> get props => [id];
}
