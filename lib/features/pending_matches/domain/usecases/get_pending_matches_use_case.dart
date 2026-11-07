import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';
import 'package:denta/features/pending_matches/domain/repositories/pending_matches_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPendingMatchesUseCase {
  final PendingMatchesRepo pendingMatchesRepo;
  GetPendingMatchesUseCase({required this.pendingMatchesRepo});

  Future<Result<List<PendingMatchEntity>>> call() async {
    return await pendingMatchesRepo.getPendingMatches();
  }
}
