import 'package:dio/dio.dart';

class VerificationInfoRequestModel {
  final String fullName;
  final String universityId;
  final String academicYear;
  final String governorate;
  final String idCardPath;
  final String? avatarPath;

  const VerificationInfoRequestModel({
    required this.fullName,
    required this.universityId,
    required this.academicYear,
    required this.governorate,
    required this.idCardPath,
    this.avatarPath,
  });

  Future<FormData> toFormData() async {
    final form = FormData.fromMap({
      'fullName': fullName,
      'universityId': universityId,
      'academicYear': academicYear,
      'governorate': governorate,
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
