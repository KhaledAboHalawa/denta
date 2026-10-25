import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/questionnaire/domain/entities/profile_extras_params.dart';
import 'package:denta/features/questionnaire/domain/repositories/questionnaire_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveProfileExtrasUseCase {
  final QuestionnaireRepo questionnaireRepo;
  SaveProfileExtrasUseCase({required this.questionnaireRepo});

  Future<Result<bool>> call(ProfileExtrasParams params) async {
    return await questionnaireRepo.saveProfileExtras(params);
  }
}
