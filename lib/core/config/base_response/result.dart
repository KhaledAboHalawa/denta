// result.dart
import 'package:equatable/equatable.dart';

import '../../errors/errors_handler.dart';

sealed class Result<T> extends Equatable {
  const Result();

  const factory Result.success(T data) = Success;
  const factory Result.error(Failure failure) = Error;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) =>
    switch (this) {
      Success<T> successResult => success(successResult.data),
      Error<T> errorResult => error(errorResult.failure),
    };

  @override
  List<Object?> get props => [];
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);

  @override
  List<Object?> get props => [data];
}

class Error<T> extends Result<T> {
  final Failure failure;
  const Error(this.failure);

  @override
  List<Object?> get props => [failure];
}
