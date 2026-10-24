import 'package:denta/features/questionnaire/data/models/verification_info_request_model.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:equatable/equatable.dart';

/// Step 1 data (identity + verification).
class VerificationInfoParams extends Equatable {
  final String fullName;
  final String universityId;
  final AcademicYear academicYear;
  final String governorate;
  final String idCardPath;
  final String? avatarPath;

  const VerificationInfoParams({
    required this.fullName,
    required this.universityId,
    required this.academicYear,
    required this.governorate,
    required this.idCardPath,
    this.avatarPath,
  });

  VerificationInfoRequestModel toModel() {
    return VerificationInfoRequestModel(
      fullName: fullName,
      universityId: universityId,
      academicYear: academicYear.name,
      governorate: governorate,
      idCardPath: idCardPath,
      avatarPath: avatarPath,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    universityId,
    academicYear,
    governorate,
    idCardPath,
    avatarPath,
  ];
}
