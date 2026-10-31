import 'dart:async';

import 'package:denta/core/config/base_state/base_state.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/notification_entity.dart';
import '../../domain/usecases/delete_notification_use_case.dart';
import '../../domain/usecases/get_notifications_use_case.dart';
import '../../domain/usecases/mark_all_notifications_read_use_case.dart';
import '../../domain/usecases/mark_notification_read_use_case.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

@lazySingleton
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
    this._getNotificationsUseCase,
    this._markNotificationReadUseCase,
    this._markAllNotificationsReadUseCase,
    this._deleteNotificationUseCase,
  ) : super(const NotificationsState.initial()) {
    _notificationsSubscription = _getNotificationsUseCase.watch().listen(
      _onNotificationsUpdated,
    );
  }

  final GetNotificationsUseCase _getNotificationsUseCase;
  final MarkNotificationReadUseCase _markNotificationReadUseCase;
  final MarkAllNotificationsReadUseCase _markAllNotificationsReadUseCase;
  final DeleteNotificationUseCase _deleteNotificationUseCase;
  late final StreamSubscription<List<NotificationEntity>> _notificationsSubscription;

  void _onNotificationsUpdated(List<NotificationEntity> items) {
    // Don't replace an active loading/error state with a stream event unless
    // notifications have already been loaded into the screen.
    if (state.response.data == null) return;
    emit(state.copyWith(response: BaseState.success(items)));
  }

  @override
  Future<void> close() async {
    await _notificationsSubscription.cancel();
    await super.close();
  }

  void doIntent(NotificationsEvent event) {
    event.when(
      load: _load,
      selectCategory: _selectCategory,
      markAsRead: _markAsRead,
      markAllAsRead: _markAllAsRead,
      deleteNotification: _deleteNotification,
    );
  }

  void _load() async {
    emit(state.copyWith(response: const BaseState.loading()));
    final result = await _getNotificationsUseCase();
    result.when(
      success: (items) => emit(state.copyWith(response: BaseState.success(items))),
      error: (failure) => emit(state.copyWith(response: BaseState.error(failure.message))),
    );
  }

  void _selectCategory(NotificationCategory category) =>
      emit(state.copyWith(selectedCategory: category));

  void _markAsRead(int id) async {
    final result = await _markNotificationReadUseCase(id);
    result.when(
      success: (updated) {
        final items = state.response.data;
        if (items == null) return;
        emit(state.copyWith(
          response: BaseState.success(items
              .map((item) => item.id == updated.id ? updated : item)
              .toList()),
        ));
      },
      error: (_) {},
    );
  }

  void _deleteNotification(int id) async {
    final result = await _deleteNotificationUseCase(id);
    result.when(
      success: (deletedId) {
        final items = state.response.data;
        if (items == null) return;
        emit(state.copyWith(
          response: BaseState.success(
            items.where((item) => item.id != deletedId).toList(),
          ),
        ));
      },
      error: (failure) => emit(state.copyWith(
        response: BaseState.error(failure.message, data: state.response.data),
      )),
    );
  }

  void _markAllAsRead(NotificationCategory category, bool isToday) async {
    final result = await _markAllNotificationsReadUseCase(
      category: category,
      isToday: isToday,
    );
    result.when(
      success: (items) => emit(state.copyWith(response: BaseState.success(items))),
      error: (failure) => emit(state.copyWith(response: BaseState.error(failure.message))),
    );
  }
}
