import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/errors/errors_handler.dart';
import 'package:denta/features/pending_matches/data/models/pending_match_model.dart';
import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';
import 'package:denta/features/pending_matches/domain/repositories/pending_matches_repo.dart';
import 'package:denta/features/pending_matches/domain/usecases/get_pending_matches_use_case.dart';
import 'package:denta/features/pending_matches/presentation/cubit/pending_matches_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeRepo implements PendingMatchesRepo {
  int calls = 0;
  Result<List<PendingMatchEntity>> result = Result.success([
    PendingMatchEntity(
      id: '1',
      title: 'Composite Restoration',
      location: 'Alexandria, Egypt',
      requestedAt: DateTime(2026, 10, 8),
      status: PendingMatchStatus.searchingForPatients,
    ),
    PendingMatchEntity(
      id: '2',
      title: 'Amalgam Restoration',
      location: 'Alexandria, Egypt',
      requestedAt: DateTime(2026, 10, 8),
      status: PendingMatchStatus.needsAdjustments,
    ),
  ]);

  @override
  Future<Result<List<PendingMatchEntity>>> getPendingMatches() async {
    calls++;
    return result;
  }
}

void main() {
  late _FakeRepo repo;
  late PendingMatchesCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = PendingMatchesCubit(GetPendingMatchesUseCase(pendingMatchesRepo: repo));
  });

  tearDown(() => cubit.close());

  test('starts in the initial state', () {
    expect(cubit.state.matches.status.name, 'initial');
  });

  test('load emits loading then the matches', () async {
    cubit.doIntent(const PendingMatchesLoadEvent());
    expect(cubit.state.matches.isLoading, isTrue);
    await pumpEventQueue();
    expect(cubit.state.matches.isSuccess, isTrue);
    expect(cubit.state.matches.data, hasLength(2));
  });

  test('a second load while loading is ignored', () async {
    cubit.doIntent(const PendingMatchesLoadEvent());
    cubit.doIntent(const PendingMatchesLoadEvent());
    await pumpEventQueue();
    expect(repo.calls, 1);
  });

  test('a failure becomes an error state and can be retried', () async {
    repo.result = Result.error(
      Failure(
        statusCode: 500,
        message: 'boom',
        success: false,
        status: ApiInternalStatus.failure,
      ),
    );
    cubit.doIntent(const PendingMatchesLoadEvent());
    await pumpEventQueue();
    expect(cubit.state.matches.isError, isTrue);
    expect(cubit.state.matches.error, 'boom');

    repo.result = const Result.success([]);
    cubit.doIntent(const PendingMatchesLoadEvent());
    await pumpEventQueue();
    expect(cubit.state.matches.isSuccess, isTrue);
    expect(cubit.state.matches.data, isEmpty);
  });

  test('model maps the status string to the entity status', () {
    PendingMatchStatus statusOf(String value) => PendingMatchModel.fromJson({
      'id': 1,
      'title': 'x',
      'location': 'y',
      'requestedAt': '2026-10-08',
      'status': value,
    }).toEntity().status;

    expect(statusOf('needs_adjustments'), PendingMatchStatus.needsAdjustments);
    expect(
      statusOf('searching_for_patients'),
      PendingMatchStatus.searchingForPatients,
    );
    expect(statusOf('anything_else'), PendingMatchStatus.searchingForPatients);
  });
}
