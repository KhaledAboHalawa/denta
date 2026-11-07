import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';

abstract class PendingMatchesRepo {
  Future<Result<List<PendingMatchEntity>>> getPendingMatches();
}
