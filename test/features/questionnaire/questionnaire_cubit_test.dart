import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/core/errors/errors_handler.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:denta/features/questionnaire/domain/entities/profile_extras_params.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/domain/entities/verification_info_params.dart';
import 'package:denta/features/questionnaire/domain/repositories/questionnaire_repo.dart';
import 'package:denta/features/questionnaire/domain/usecases/get_universities_use_case.dart';
import 'package:denta/features/questionnaire/domain/usecases/save_profile_extras_use_case.dart';
import 'package:denta/features/questionnaire/domain/usecases/submit_verification_info_use_case.dart';
import 'package:denta/features/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeRepo implements QuestionnaireRepo {
  int step1Calls = 0;
  int step2Calls = 0;
  Result<bool> step1Result = const Result.success(true);

  @override
  Future<Result<List<UniversityEntity>>> getUniversities() async =>
      const Result.success([UniversityEntity(id: '1', name: 'Cairo University')]);

  @override
  Future<Result<bool>> submitVerificationInfo(
    VerificationInfoParams params,
  ) async {
    step1Calls++;
    return step1Result;
  }

  @override
  Future<Result<bool>> saveProfileExtras(ProfileExtrasParams params) async {
    step2Calls++;
    return const Result.success(true);
  }
}

void main() {
  late _FakeRepo repo;
  late QuestionnaireCubit cubit;

  setUp(() {
    repo = _FakeRepo();
    cubit = QuestionnaireCubit(
      GetUniversitiesUseCase(questionnaireRepo: repo),
      SubmitVerificationInfoUseCase(questionnaireRepo: repo),
      SaveProfileExtrasUseCase(questionnaireRepo: repo),
    );
  });

  tearDown(() => cubit.close());

  void fillStep1() {
    cubit.doIntent(const QuestionnaireUpdateFullNameEvent('Ahmed Ali'));
    cubit.doIntent(
      const QuestionnaireSelectUniversityEvent(
        UniversityEntity(id: '1', name: 'Cairo University'),
      ),
    );
    cubit.doIntent(
      const QuestionnaireSelectAcademicYearEvent(AcademicYear.second),
    );
    cubit.doIntent(const QuestionnaireSelectGovernorateEvent('cairo'));
    cubit.doIntent(const QuestionnaireSetIdCardEvent('/tmp/id.jpg'));
  }

  test('full name needs at least two words', () {
    cubit.doIntent(const QuestionnaireUpdateFullNameEvent('Ahmed'));
    expect(cubit.state.hasValidFullName, isFalse);
    cubit.doIntent(const QuestionnaireUpdateFullNameEvent('Ahmed Ali'));
    expect(cubit.state.hasValidFullName, isTrue);
  });

  test('invalid step 1 shows errors and does not call the repo', () async {
    cubit.doIntent(const QuestionnaireSubmitStep1Event());
    await pumpEventQueue();
    expect(cubit.state.showStep1Errors, isTrue);
    expect(repo.step1Calls, 0);
    expect(cubit.state.stepIndex, 0);
  });

  test('valid step 1 submits and moves to step 2', () async {
    fillStep1();
    cubit.doIntent(const QuestionnaireSubmitStep1Event());
    await pumpEventQueue();
    expect(repo.step1Calls, 1);
    expect(cubit.state.step1Response.isSuccess, isTrue);
    expect(cubit.state.stepIndex, 1);
  });

  test('failed step 1 stays on step 1 with an error', () async {
    repo.step1Result = Result.error(
      Failure(statusCode: 400, message: 'bad', success: false, status: 0),
    );
    fillStep1();
    cubit.doIntent(const QuestionnaireSubmitStep1Event());
    await pumpEventQueue();
    expect(cubit.state.step1Response.isError, isTrue);
    expect(cubit.state.stepIndex, 0);
  });

  test('step 2 cannot be opened before step 1 succeeds', () {
    cubit.doIntent(const QuestionnaireGoToStepEvent(1));
    expect(cubit.state.stepIndex, 0);
  });

  test('skipping step 2 finishes the flow without calling the repo', () async {
    cubit.doIntent(const QuestionnaireSkipStep2Event());
    await pumpEventQueue();
    expect(cubit.state.step2Response.isSuccess, isTrue);
    expect(repo.step2Calls, 0);
  });
}
