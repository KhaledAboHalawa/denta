import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/features/questionnaire/data/models/verification_info_request_model.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:equatable/equatable.dart';

/// Step 1 data (identity + verification).
///
/// Doubles as the form's working copy inside the cubit state, so every value
/// can be empty until the user fills it in. Check [isValid] before submitting.
class VerificationInfoParams extends Equatable {
  const VerificationInfoParams({
    this.fullName = '',
    this.university,
    this.academicYear,
    this.governorate,
    this.idCardPath,
    this.avatarPath,
  });

  final String fullName;
  final UniversityEntity? university;
  final AcademicYear? academicYear;
  final String? governorate;
  final String? idCardPath;
  final String? avatarPath;

  bool get isValidFullName => AppValidators.validateFullName(fullName) == null;

  /// Everything required is filled in (the avatar is optional).
  bool get isValid =>
      isValidFullName &&
      university != null &&
      academicYear != null &&
      governorate != null &&
      idCardPath != null;

  VerificationInfoParams copyWith({
    String? fullName,
    UniversityEntity? university,
    AcademicYear? academicYear,
    String? governorate,
    String? idCardPath,
    String? avatarPath,
    bool clearIdCard = false,
    bool clearAvatar = false,
  }) {
    return VerificationInfoParams(
      fullName: fullName ?? this.fullName,
      university: university ?? this.university,
      academicYear: academicYear ?? this.academicYear,
      governorate: governorate ?? this.governorate,
      idCardPath: clearIdCard ? null : (idCardPath ?? this.idCardPath),
      avatarPath: clearAvatar ? null : (avatarPath ?? this.avatarPath),
    );
  }

  /// Only call when [isValid] is true.
  VerificationInfoRequestModel toModel() {
    return VerificationInfoRequestModel(
      fullName: fullName.trim(),
      universityId: university!.id,
      academicYear: academicYear!.name,
      governorate: governorate!,
      idCardPath: idCardPath!,
      avatarPath: avatarPath,
    );
  }

  @override
  List<Object?> get props => [
    fullName,
    university,
    academicYear,
    governorate,
    idCardPath,
    avatarPath,
  ];
}
