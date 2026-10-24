part of 'questionnaire_cubit.dart';

class QuestionnaireState extends Equatable {
  const QuestionnaireState({
    required this.stepIndex,
    required this.universities,
    required this.step1Response,
    required this.step2Response,
    this.showStep1Errors = false,
    this.fullName = '',
    this.selectedUniversity,
    this.academicYear,
    this.governorate,
    this.idCardPath,
    this.avatarPath,
    this.bio = '',
    this.certificationPaths = const [],
    this.casePhotoPaths = const [],
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
  final String fullName;
  final UniversityEntity? selectedUniversity;
  final AcademicYear? academicYear;
  final String? governorate;
  final String? idCardPath;
  final String? avatarPath;

  /// Turns on inline errors for untouched step 1 fields after a failed Next.
  final bool showStep1Errors;

  /// Step 2 form values.
  final String bio;
  final List<String> certificationPaths;
  final List<String> casePhotoPaths;

  final BaseState<bool> step1Response;

  /// Success here means the whole questionnaire is finished (saved or skipped).
  final BaseState<bool> step2Response;

  static final RegExp _nameRegex = RegExp(r"^[\p{L}\s'-]+$", unicode: true);

  /// Letters only, 2-50 characters, and at least two words (first + last).
  bool get hasValidFullName {
    final name = fullName.trim();
    if (name.length < 2 || name.length > 50) return false;
    if (!_nameRegex.hasMatch(name)) return false;
    return name.split(RegExp(r'\s+')).length >= 2;
  }

  bool get isStep1Valid =>
      hasValidFullName &&
      selectedUniversity != null &&
      academicYear != null &&
      governorate != null &&
      idCardPath != null;

  QuestionnaireState copyWith({
    int? stepIndex,
    BaseState<List<UniversityEntity>>? universities,
    String? fullName,
    UniversityEntity? selectedUniversity,
    AcademicYear? academicYear,
    String? governorate,
    String? idCardPath,
    String? avatarPath,
    bool clearIdCard = false,
    bool clearAvatar = false,
    bool? showStep1Errors,
    String? bio,
    List<String>? certificationPaths,
    List<String>? casePhotoPaths,
    BaseState<bool>? step1Response,
    BaseState<bool>? step2Response,
  }) {
    return QuestionnaireState(
      stepIndex: stepIndex ?? this.stepIndex,
      universities: universities ?? this.universities,
      fullName: fullName ?? this.fullName,
      selectedUniversity: selectedUniversity ?? this.selectedUniversity,
      academicYear: academicYear ?? this.academicYear,
      governorate: governorate ?? this.governorate,
      idCardPath: clearIdCard ? null : (idCardPath ?? this.idCardPath),
      avatarPath: clearAvatar ? null : (avatarPath ?? this.avatarPath),
      showStep1Errors: showStep1Errors ?? this.showStep1Errors,
      bio: bio ?? this.bio,
      certificationPaths: certificationPaths ?? this.certificationPaths,
      casePhotoPaths: casePhotoPaths ?? this.casePhotoPaths,
      step1Response: step1Response ?? this.step1Response,
      step2Response: step2Response ?? this.step2Response,
    );
  }

  @override
  List<Object?> get props => [
    stepIndex,
    universities,
    fullName,
    selectedUniversity,
    academicYear,
    governorate,
    idCardPath,
    avatarPath,
    showStep1Errors,
    bio,
    certificationPaths,
    casePhotoPaths,
    step1Response,
    step2Response,
  ];
}
