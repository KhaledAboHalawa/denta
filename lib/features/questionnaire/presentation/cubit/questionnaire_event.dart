part of 'questionnaire_cubit.dart';

sealed class QuestionnaireEvent extends Equatable {
  const QuestionnaireEvent();

  @override
  List<Object?> get props => [];

  T when<T>({
    required T Function() loadUniversities,
    required T Function(String value) updateFullName,
    required T Function(UniversityEntity value) selectUniversity,
    required T Function(AcademicYear value) selectAcademicYear,
    required T Function(String value) selectGovernorate,
    required T Function(String? path) setIdCard,
    required T Function(String? path) setAvatar,
    required T Function() submitStep1,
    required T Function(String value) updateBio,
    required T Function(List<String> paths) setCertifications,
    required T Function(List<String> paths) setCasePhotos,
    required T Function() submitStep2,
    required T Function() skipStep2,
    required T Function(int index) goToStep,
  }) {
    return switch (this) {
      QuestionnaireLoadUniversitiesEvent() => loadUniversities(),
      QuestionnaireUpdateFullNameEvent event => updateFullName(event.value),
      QuestionnaireSelectUniversityEvent event => selectUniversity(event.value),
      QuestionnaireSelectAcademicYearEvent event => selectAcademicYear(
        event.value,
      ),
      QuestionnaireSelectGovernorateEvent event => selectGovernorate(
        event.value,
      ),
      QuestionnaireSetIdCardEvent event => setIdCard(event.path),
      QuestionnaireSetAvatarEvent event => setAvatar(event.path),
      QuestionnaireSubmitStep1Event() => submitStep1(),
      QuestionnaireUpdateBioEvent event => updateBio(event.value),
      QuestionnaireSetCertificationsEvent event => setCertifications(
        event.paths,
      ),
      QuestionnaireSetCasePhotosEvent event => setCasePhotos(event.paths),
      QuestionnaireSubmitStep2Event() => submitStep2(),
      QuestionnaireSkipStep2Event() => skipStep2(),
      QuestionnaireGoToStepEvent event => goToStep(event.index),
    };
  }
}

class QuestionnaireLoadUniversitiesEvent extends QuestionnaireEvent {
  const QuestionnaireLoadUniversitiesEvent();
}

class QuestionnaireUpdateFullNameEvent extends QuestionnaireEvent {
  final String value;
  const QuestionnaireUpdateFullNameEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class QuestionnaireSelectUniversityEvent extends QuestionnaireEvent {
  final UniversityEntity value;
  const QuestionnaireSelectUniversityEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class QuestionnaireSelectAcademicYearEvent extends QuestionnaireEvent {
  final AcademicYear value;
  const QuestionnaireSelectAcademicYearEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class QuestionnaireSelectGovernorateEvent extends QuestionnaireEvent {
  final String value;
  const QuestionnaireSelectGovernorateEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class QuestionnaireSetIdCardEvent extends QuestionnaireEvent {
  final String? path;
  const QuestionnaireSetIdCardEvent(this.path);

  @override
  List<Object?> get props => [path];
}

class QuestionnaireSetAvatarEvent extends QuestionnaireEvent {
  final String? path;
  const QuestionnaireSetAvatarEvent(this.path);

  @override
  List<Object?> get props => [path];
}

class QuestionnaireSubmitStep1Event extends QuestionnaireEvent {
  const QuestionnaireSubmitStep1Event();
}

class QuestionnaireUpdateBioEvent extends QuestionnaireEvent {
  final String value;
  const QuestionnaireUpdateBioEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class QuestionnaireSetCertificationsEvent extends QuestionnaireEvent {
  final List<String> paths;
  const QuestionnaireSetCertificationsEvent(this.paths);

  @override
  List<Object?> get props => [paths];
}

class QuestionnaireSetCasePhotosEvent extends QuestionnaireEvent {
  final List<String> paths;
  const QuestionnaireSetCasePhotosEvent(this.paths);

  @override
  List<Object?> get props => [paths];
}

class QuestionnaireSubmitStep2Event extends QuestionnaireEvent {
  const QuestionnaireSubmitStep2Event();
}

class QuestionnaireSkipStep2Event extends QuestionnaireEvent {
  const QuestionnaireSkipStep2Event();
}

class QuestionnaireGoToStepEvent extends QuestionnaireEvent {
  final int index;
  const QuestionnaireGoToStepEvent(this.index);

  @override
  List<Object?> get props => [index];
}
