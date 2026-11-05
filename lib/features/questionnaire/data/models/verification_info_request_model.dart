import 'package:dio/dio.dart';

import '../../domain/entities/verification_info_params.dart';

class VerificationInfoRequestModel {
  final String fullName;
  final String universityId;
  final String academicYear;
  final String governorate;
  final String idCardPath;
  final String? avatarPath;
  final Gender? gender;

  const VerificationInfoRequestModel({
    required this.fullName,
    required this.universityId,
    required this.academicYear,
    required this.governorate,
    required this.idCardPath,
    this.avatarPath, this.gender,
  });

  Future<FormData> toFormData() async {
    final form = FormData.fromMap({
      'fullName': fullName,
      'universityId': universityId,
      'academicYear': academicYear,
      'governorate': governorate,
      'gender' : gender?.name
    });
    form.files.add(
      MapEntry('idCard', await MultipartFile.fromFile(idCardPath)),
    );
    if (avatarPath != null) {
      form.files.add(
        MapEntry('avatar', await MultipartFile.fromFile(avatarPath!)),
      );
    }
    return form;
  }
}
