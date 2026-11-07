import 'package:equatable/equatable.dart';

enum PendingMatchStatus {
  /// Waiting for a patient: the student can only open the details.
  searchingForPatients,

  /// Sent back to the student: the case request must be edited.
  needsAdjustments,
}

class PendingMatchEntity extends Equatable {
  const PendingMatchEntity({
    required this.id,
    required this.title,
    required this.location,
    required this.requestedAt,
    required this.status,
  });

  final String id;
  final String title;
  final String location;
  final DateTime requestedAt;
  final PendingMatchStatus status;

  @override
  List<Object?> get props => [id, title, location, requestedAt, status];
}
