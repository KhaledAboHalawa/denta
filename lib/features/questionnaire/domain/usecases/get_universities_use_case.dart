import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/domain/repositories/questionnaire_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUniversitiesUseCase {
  final QuestionnaireRepo questionnaireRepo;
  GetUniversitiesUseCase({required this.questionnaireRepo});

  Future<Result<List<UniversityEntity>>> call() async {
    return await questionnaireRepo.getUniversities();
  }
}
