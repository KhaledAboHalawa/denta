import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/questionnaire/domain/entities/verification_info_params.dart';
import 'package:denta/features/questionnaire/domain/repositories/questionnaire_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SubmitVerificationInfoUseCase {
  final QuestionnaireRepo questionnaireRepo;
  SubmitVerificationInfoUseCase({required this.questionnaireRepo});

  Future<Result<bool>> call(VerificationInfoParams params) async {
    return await questionnaireRepo.submitVerificationInfo(params);
  }
}
