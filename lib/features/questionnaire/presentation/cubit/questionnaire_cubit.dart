import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:denta/features/questionnaire/domain/entities/profile_extras_params.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/domain/entities/verification_info_params.dart';
import 'package:denta/features/questionnaire/domain/usecases/get_universities_use_case.dart';
import 'package:denta/features/questionnaire/domain/usecases/save_profile_extras_use_case.dart';
import 'package:denta/features/questionnaire/domain/usecases/submit_verification_info_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'questionnaire_event.dart';
part 'questionnaire_state.dart';

/// Not a singleton on purpose: the questionnaire should start clean every
/// time it is opened. Provide it with `BlocProvider(create: ...)`.
@injectable
class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final GetUniversitiesUseCase getUniversitiesUseCase;
  final SubmitVerificationInfoUseCase submitVerificationInfoUseCase;
  final SaveProfileExtrasUseCase saveProfileExtrasUseCase;

  QuestionnaireCubit(
    this.getUniversitiesUseCase,
    this.submitVerificationInfoUseCase,
    this.saveProfileExtrasUseCase,
  ) : super(const QuestionnaireState.initial());

  void doIntent(QuestionnaireEvent event) {
    event.when(
      loadUniversities: _loadUniversities,
      updateFullName: _updateFullName,
      selectUniversity: _selectUniversity,
      selectAcademicYear: _selectAcademicYear,
      selectGovernorate: _selectGovernorate,
      setIdCard: _setIdCard,
      setAvatar: _setAvatar,
      submitStep1: _submitStep1,
      updateBio: _updateBio,
      setCertifications: _setCertifications,
      setCasePhotos: _setCasePhotos,
      submitStep2: _submitStep2,
      skipStep2: _skipStep2,
      goToStep: _goToStep,
    );
  }

  void _loadUniversities() async {
    if (state.universities.isLoading) return;
    emit(state.copyWith(universities: const BaseState.loading()));
    final result = await getUniversitiesUseCase();
    result.when(
      success: (list) =>
          emit(state.copyWith(universities: BaseState.success(list))),
      error: (fail) =>
          emit(state.copyWith(universities: BaseState.error(fail.message))),
    );
  }

  void _updateFullName(String value) =>
      emit(state.copyWith(fullName: value));

  void _selectUniversity(UniversityEntity value) =>
      emit(state.copyWith(selectedUniversity: value));

  void _selectAcademicYear(AcademicYear value) =>
      emit(state.copyWith(academicYear: value));

  void _selectGovernorate(String value) =>
      emit(state.copyWith(governorate: value));

  void _setIdCard(String? path) => emit(
    state.copyWith(idCardPath: path, clearIdCard: path == null),
  );

  void _setAvatar(String? path) => emit(
    state.copyWith(avatarPath: path, clearAvatar: path == null),
  );

  void _submitStep1() async {
    if (state.step1Response.isLoading) return;
    if (!state.isStep1Valid) {
      emit(state.copyWith(showStep1Errors: true));
      return;
    }
    emit(state.copyWith(step1Response: const BaseState.loading()));
    final result = await submitVerificationInfoUseCase(
      VerificationInfoParams(
        fullName: state.fullName.trim(),
        universityId: state.selectedUniversity!.id,
        academicYear: state.academicYear!,
        governorate: state.governorate!,
        idCardPath: state.idCardPath!,
        avatarPath: state.avatarPath,
      ),
    );
    result.when(
      success: (_) => emit(
        state.copyWith(
          step1Response: const BaseState.success(true),
          stepIndex: 1,
        ),
      ),
      error: (fail) =>
          emit(state.copyWith(step1Response: BaseState.error(fail.message))),
    );
  }

  void _updateBio(String value) => emit(state.copyWith(bio: value));

  void _setCertifications(List<String> paths) =>
      emit(state.copyWith(certificationPaths: paths));

  void _setCasePhotos(List<String> paths) =>
      emit(state.copyWith(casePhotoPaths: paths));

  void _submitStep2() async {
    if (state.step2Response.isLoading) return;
    emit(state.copyWith(step2Response: const BaseState.loading()));
    final result = await saveProfileExtrasUseCase(
      ProfileExtrasParams(
        bio: state.bio.trim(),
        certificationPaths: state.certificationPaths,
        casePhotoPaths: state.casePhotoPaths,
      ),
    );
    result.when(
      success: (_) =>
          emit(state.copyWith(step2Response: const BaseState.success(true))),
      error: (fail) =>
          emit(state.copyWith(step2Response: BaseState.error(fail.message))),
    );
  }

  /// Step 2 is optional: finishing the flow without calling the API.
  void _skipStep2() =>
      emit(state.copyWith(step2Response: const BaseState.success(true)));

  void _goToStep(int index) {
    if (index < 0 || index > 1 || index == state.stepIndex) return;
    // Step 2 is only reachable after step 1 has been submitted.
    if (index == 1 && !state.step1Response.isSuccess) return;
    emit(state.copyWith(stepIndex: index));
  }
}
