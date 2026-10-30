part of 'questionnaire_cubit.dart';

class QuestionnaireState extends Equatable {
  const QuestionnaireState({
    required this.stepIndex,
    required this.universities,
    required this.step1Response,
    required this.step2Response,
    this.verificationInfo = const VerificationInfoParams(),
    this.profileExtras = const ProfileExtrasParams(),
    this.showStep1Errors = false,
  });

  const QuestionnaireState.initial()
    : this(
        stepIndex: 0,
        universities: const BaseState.initial(),
        step1Response: const BaseState.initial(),
        step2Response: const BaseState.initial(),
      );

  final int stepIndex;
  final BaseState<List<UniversityEntity>> universities;

  /// Step 1 form values.
  final VerificationInfoParams verificationInfo;

  /// Step 2 form values.
  final ProfileExtrasParams profileExtras;

  /// Turns on inline errors for untouched step 1 fields after a failed Next.
  final bool showStep1Errors;

  final BaseState<bool> step1Response;

  /// Success here means the whole questionnaire is finished (saved or skipped).
  final BaseState<bool> step2Response;

  bool get isStep1Valid => verificationInfo.isValid;

  QuestionnaireState copyWith({
    int? stepIndex,
    BaseState<List<UniversityEntity>>? universities,
    VerificationInfoParams? verificationInfo,
    ProfileExtrasParams? profileExtras,
    bool? showStep1Errors,
    BaseState<bool>? step1Response,
    BaseState<bool>? step2Response,
  }) {
    return QuestionnaireState(
      stepIndex: stepIndex ?? this.stepIndex,
      universities: universities ?? this.universities,
      verificationInfo: verificationInfo ?? this.verificationInfo,
      profileExtras: profileExtras ?? this.profileExtras,
      showStep1Errors: showStep1Errors ?? this.showStep1Errors,
      step1Response: step1Response ?? this.step1Response,
      step2Response: step2Response ?? this.step2Response,
    );
  }

  @override
  List<Object?> get props => [
    stepIndex,
    universities,
    verificationInfo,
    profileExtras,
    showStep1Errors,
    step1Response,
    step2Response,
  ];
}
