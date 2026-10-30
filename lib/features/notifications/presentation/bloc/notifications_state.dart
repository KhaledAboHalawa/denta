part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    required this.response,
    required this.selectedCategory,
  });

  const NotificationsState.initial()
      : this(
          response: const BaseState.initial(),
          selectedCategory: NotificationCategory.cases,
        );

  final BaseState<List<NotificationEntity>> response;
  final NotificationCategory selectedCategory;

  NotificationsState copyWith({
    BaseState<List<NotificationEntity>>? response,
    NotificationCategory? selectedCategory,
  }) => NotificationsState(
        response: response ?? this.response,
        selectedCategory: selectedCategory ?? this.selectedCategory,
      );

  @override
  List<Object?> get props => [response, selectedCategory];
}
