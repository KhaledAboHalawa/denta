import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/pending_matches/data/datasources/pending_matches_data_source.dart';
import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';
import 'package:denta/features/pending_matches/domain/repositories/pending_matches_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PendingMatchesRepo)
class PendingMatchesRepoImpl implements PendingMatchesRepo {
  final PendingMatchesDataSource pendingMatchesDataSource;
  PendingMatchesRepoImpl({required this.pendingMatchesDataSource});

  @override
  Future<Result<List<PendingMatchEntity>>> getPendingMatches() async {
    final result = await pendingMatchesDataSource.getPendingMatches();
    return result.when(
      success: (res) => Result.success(res.map((e) => e.toEntity()).toList()),
      error: (fail) => Result.error(fail),
    );
  }
}
