import 'package:equatable/equatable.dart';

enum StateStatus { initial, loading, success, error }

class BaseState<T> extends Equatable {
  final StateStatus status;
  final T? data;
  final String? error;
  const BaseState({required this.status, this.data, this.error});
  const BaseState.initial() : this(status: StateStatus.initial);
  const BaseState.loading({T? data})
    : this(status: StateStatus.loading, data: data);
  const BaseState.success(T data)
    : this(status: StateStatus.success, data: data);
  const BaseState.error(String error, {T? data})
    : this(status: StateStatus.error, error: error, data: data);
  @override
  List<Object?> get props => [status, data, error];
  // added when method to make the code more readable in the UI
  R when<R>({
    required R Function(T data) success,
    required R Function() loading,
    R Function()? moreLoading,
    required R Function(String errorMessage) error,
    required R Function() initial,
  }) {
    return switch (status) {
      StateStatus.initial => initial(),
      StateStatus.loading => loading(),
      StateStatus.success => success(data as T),
      StateStatus.error => error(error as String),
    };
  }
}

extension BaseStateExtensions<T> on BaseState<T> {
  bool get isLoading => status == StateStatus.loading;
  bool get isSuccess => status == StateStatus.success;
  bool get isError => status == StateStatus.error;
  bool get isInitial => status == StateStatus.initial;
}
