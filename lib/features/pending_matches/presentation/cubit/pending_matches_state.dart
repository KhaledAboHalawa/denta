part of 'pending_matches_cubit.dart';

class PendingMatchesState extends Equatable {
  const PendingMatchesState({required this.matches});

  const PendingMatchesState.initial()
    : this(matches: const BaseState.initial());

  final BaseState<List<PendingMatchEntity>> matches;

  PendingMatchesState copyWith({
    BaseState<List<PendingMatchEntity>>? matches,
  }) => PendingMatchesState(matches: matches ?? this.matches);

  @override
  List<Object?> get props => [matches];
}
