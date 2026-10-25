import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/questionnaire/domain/entities/profile_extras_params.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/domain/entities/verification_info_params.dart';

abstract class QuestionnaireRepo {
  Future<Result<List<UniversityEntity>>> getUniversities();
  Future<Result<bool>> submitVerificationInfo(VerificationInfoParams params);
  Future<Result<bool>> saveProfileExtras(ProfileExtrasParams params);
}
