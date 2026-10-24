import 'package:dio/dio.dart';

class ProfileExtrasRequestModel {
  final String bio;
  final List<String> certificationPaths;
  final List<String> casePhotoPaths;

  const ProfileExtrasRequestModel({
    required this.bio,
    required this.certificationPaths,
    required this.casePhotoPaths,
  });

  Future<FormData> toFormData() async {
    final form = FormData.fromMap({'bio': bio});
    for (final path in certificationPaths) {
      form.files.add(
        MapEntry('certifications', await MultipartFile.fromFile(path)),
      );
    }
    for (final path in casePhotoPaths) {
      form.files.add(
        MapEntry('casePhotos', await MultipartFile.fromFile(path)),
      );
    }
    return form;
  }
}
