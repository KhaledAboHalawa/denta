import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';
import 'package:denta/features/pending_matches/domain/usecases/get_pending_matches_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'pending_matches_event.dart';
part 'pending_matches_state.dart';

/// Not a singleton on purpose: every screen/section that shows pending
/// matches loads a fresh list. Provide it with `BlocProvider(create: ...)`.
@injectable
class PendingMatchesCubit extends Cubit<PendingMatchesState> {
  final GetPendingMatchesUseCase getPendingMatchesUseCase;

  PendingMatchesCubit(this.getPendingMatchesUseCase)
    : super(const PendingMatchesState.initial());

  void doIntent(PendingMatchesEvent event) {
    event.when(load: _load);
  }

  void _load() async {
    if (state.matches.isLoading) return;
    emit(state.copyWith(matches: const BaseState.loading()));
    final result = await getPendingMatchesUseCase();
    if (isClosed) return;
    result.when(
      success: (list) =>
          emit(state.copyWith(matches: BaseState.success(list))),
      error: (fail) =>
          emit(state.copyWith(matches: BaseState.error(fail.message))),
    );
  }
}
