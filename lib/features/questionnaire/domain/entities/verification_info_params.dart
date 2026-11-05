import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/features/questionnaire/data/models/verification_info_request_model.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/l10n/app_localizations.dart';

enum Gender { male, female }

extension GenderL10n on Gender {
  String label(AppLocalizations l10n) => switch (this) {
    Gender.male => l10n.male,
    Gender.female => l10n.female,
  };
}

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
    this.gender,
  });

  final String fullName;
  final UniversityEntity? university;
  final AcademicYear? academicYear;
  final String? governorate;
  final String? idCardPath;
  final String? avatarPath;
  final Gender? gender;

  bool get isValidFullName => AppValidators.validateFullName(fullName) == null;

  /// Everything required is filled in (the avatar is optional).
  bool get isValid =>
      isValidFullName &&
      university != null &&
      academicYear != null &&
      governorate != null &&
      idCardPath != null &&
      gender != null;

  VerificationInfoParams copyWith({
    String? fullName,
    UniversityEntity? university,
    AcademicYear? academicYear,
    String? governorate,
    String? idCardPath,
    String? avatarPath,
    bool clearIdCard = false,
    bool clearAvatar = false,
    Gender? gender,
  }) {
    return VerificationInfoParams(
      fullName: fullName ?? this.fullName,
      university: university ?? this.university,
      academicYear: academicYear ?? this.academicYear,
      governorate: governorate ?? this.governorate,
      idCardPath: clearIdCard ? null : (idCardPath ?? this.idCardPath),
      avatarPath: clearAvatar ? null : (avatarPath ?? this.avatarPath),
      gender: gender ?? this.gender,
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
      gender: gender,
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
    gender,
  ];
}
