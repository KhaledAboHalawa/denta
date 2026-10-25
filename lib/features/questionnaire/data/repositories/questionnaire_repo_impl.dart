import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/questionnaire/data/datasources/questionnaire_data_source.dart';
import 'package:denta/features/questionnaire/domain/entities/profile_extras_params.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/domain/entities/verification_info_params.dart';
import 'package:denta/features/questionnaire/domain/repositories/questionnaire_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: QuestionnaireRepo)
class QuestionnaireRepoImpl implements QuestionnaireRepo {
  final QuestionnaireDataSource questionnaireDataSource;
  QuestionnaireRepoImpl({required this.questionnaireDataSource});

  @override
  Future<Result<List<UniversityEntity>>> getUniversities() async {
    final result = await questionnaireDataSource.getUniversities();
    return result.when(
      success: (res) => Result.success(res.map((e) => e.toEntity()).toList()),
      error: (fail) => Result.error(fail),
    );
  }

  @override
  Future<Result<bool>> submitVerificationInfo(
    VerificationInfoParams params,
  ) async {
    return await questionnaireDataSource.submitVerificationInfo(
      params.toModel(),
    );
  }

  @override
  Future<Result<bool>> saveProfileExtras(ProfileExtrasParams params) async {
    return await questionnaireDataSource.saveProfileExtras(params.toModel());
  }
}
