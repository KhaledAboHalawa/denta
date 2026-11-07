part of 'pending_matches_cubit.dart';

sealed class PendingMatchesEvent extends Equatable {
  const PendingMatchesEvent();

  @override
  List<Object?> get props => [];

  T when<T>({required T Function() load}) {
    return switch (this) {
      PendingMatchesLoadEvent() => load(),
    };
  }
}

class PendingMatchesLoadEvent extends PendingMatchesEvent {
  const PendingMatchesLoadEvent();
}
