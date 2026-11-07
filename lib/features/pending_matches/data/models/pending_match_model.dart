import 'package:denta/features/pending_matches/domain/entities/pending_match_entity.dart';

class PendingMatchModel {
  final String id;
  final String title;
  final String location;
  final DateTime requestedAt;
  final String status;

  const PendingMatchModel({
    required this.id,
    required this.title,
    required this.location,
    required this.requestedAt,
    required this.status,
  });

  factory PendingMatchModel.fromJson(Map<String, dynamic> json) =>
      PendingMatchModel(
        id: json['id']?.toString() ?? '',
        title: json['title']?.toString() ?? '',
        location: json['location']?.toString() ?? '',
        requestedAt:
            DateTime.tryParse(json['requestedAt']?.toString() ?? '') ??
            DateTime.fromMillisecondsSinceEpoch(0),
        status: json['status']?.toString() ?? '',
      );

  PendingMatchEntity toEntity() => PendingMatchEntity(
    id: id,
    title: title,
    location: location,
    requestedAt: requestedAt,
    status: switch (status) {
      'needs_adjustments' => PendingMatchStatus.needsAdjustments,
      _ => PendingMatchStatus.searchingForPatients,
    },
  );
}
