import 'package:denta/features/questionnaire/data/models/profile_extras_request_model.dart';
import 'package:equatable/equatable.dart';

/// Step 2 data (optional profile extras). Also the form's working copy in
/// the cubit state; everything is optional, so there is no validity check.
class ProfileExtrasParams extends Equatable {
  const ProfileExtrasParams({
    this.bio = '',
    this.certificationPaths = const [],
    this.casePhotoPaths = const [],
  });

  final String bio;
  final List<String> certificationPaths;
  final List<String> casePhotoPaths;

  ProfileExtrasParams copyWith({
    String? bio,
    List<String>? certificationPaths,
    List<String>? casePhotoPaths,
  }) {
    return ProfileExtrasParams(
      bio: bio ?? this.bio,
      certificationPaths: certificationPaths ?? this.certificationPaths,
      casePhotoPaths: casePhotoPaths ?? this.casePhotoPaths,
    );
  }

  ProfileExtrasRequestModel toModel() {
    return ProfileExtrasRequestModel(
      bio: bio.trim(),
      certificationPaths: certificationPaths,
      casePhotoPaths: casePhotoPaths,
    );
  }

  @override
  List<Object?> get props => [bio, certificationPaths, casePhotoPaths];
}
