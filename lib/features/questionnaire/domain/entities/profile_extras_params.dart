import 'package:denta/features/questionnaire/data/models/profile_extras_request_model.dart';
import 'package:equatable/equatable.dart';

/// Step 2 data (optional profile extras).
class ProfileExtrasParams extends Equatable {
  final String bio;
  final List<String> certificationPaths;
  final List<String> casePhotoPaths;

  const ProfileExtrasParams({
    this.bio = '',
    this.certificationPaths = const [],
    this.casePhotoPaths = const [],
  });

  ProfileExtrasRequestModel toModel() {
    return ProfileExtrasRequestModel(
      bio: bio,
      certificationPaths: certificationPaths,
      casePhotoPaths: casePhotoPaths,
    );
  }

  @override
  List<Object?> get props => [bio, certificationPaths, casePhotoPaths];
}
