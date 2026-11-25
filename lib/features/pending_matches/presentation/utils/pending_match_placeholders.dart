import '../../domain/entities/pending_match_entity.dart';

/// Fake matches that only feed the Skeletonizer while loading.
/// Their text is never readable: it is drawn as grey shimmering bones.
final List<PendingMatchEntity> pendingMatchPlaceholders = List.generate(
  6,
  (i) => PendingMatchEntity(
    id: '$i',
    title: 'Composite Restoration',
    location: 'Alexandria, Egypt',
    requestedAt: DateTime(2026, 1, 1),
    status: i.isEven
        ? PendingMatchStatus.searchingForPatients
        : PendingMatchStatus.needsAdjustments,
  ),
);
