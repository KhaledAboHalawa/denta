import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/core/utils/media_picker.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:denta/core/widgets/custom_text_field.dart';
import 'package:denta/features/questionnaire/domain/entities/governorate.dart';
import 'package:denta/features/questionnaire/domain/entities/university_entity.dart';
import 'package:denta/features/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:denta/features/questionnaire/presentation/widgets/academic_year_chips.dart';
import 'package:denta/core/widgets/avatar_picker.dart';
import 'package:denta/features/questionnaire/presentation/widgets/id_card_upload.dart';
import 'package:denta/features/questionnaire/presentation/widgets/image_source_sheet.dart';
import 'package:denta/features/questionnaire/presentation/widgets/selection_bottom_sheet.dart';
import 'package:denta/core/widgets/selector_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'confirm_cancel_questionnaire.dart';

/// Step 1: identity and verification.
class VerificationInfoForm extends StatefulWidget {
  const VerificationInfoForm({super.key});

  @override
  State<VerificationInfoForm> createState() => _VerificationInfoFormState();
}

class _VerificationInfoFormState extends State<VerificationInfoForm> {
  late final QuestionnaireCubit _cubit;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _nameController;
  late final FocusNode _nameNode;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<QuestionnaireCubit>();
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController(
      text: _cubit.state.verificationInfo.fullName,
    );
    _nameNode = FocusNode();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameNode.dispose();
    super.dispose();
  }

  Future<void> _pickImage(void Function(String path) onPicked) async {
    final source = await showImageSourceSheet(context);
    if (source == null) return;
    final path = await MediaPicker.pickImage(source);
    if (path != null) onPicked(path);
  }

  Future<void> _pickUniversity(QuestionnaireState state) async {
    final universities = state.universities;
    if (universities.isLoading) return;
    if (universities.isError || universities.isInitial) {
      _cubit.doIntent(const QuestionnaireLoadUniversitiesEvent());
      return;
    }
    _nameNode.unfocus();
    final l10n = AppLocalizations.of(context)!;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final picked = await showSelectionSheet<UniversityEntity>(  
      context,  
      title: l10n.questionnaireUniversityLabel,
      selected: state.verificationInfo.university,
      items: (universities.data ?? [])
          .map((u) => SelectionItem(value: u, label: u.name))
          .toList(),
    );
    if (picked != null) {
      _cubit.doIntent(QuestionnaireSelectUniversityEvent(picked));
    }

    });
  }

  Future<void> _pickGovernorate(QuestionnaireState state) async {
    final l10n = AppLocalizations.of(context)!;
    final lang = Localizations.localeOf(context).languageCode;
    final picked = await showSelectionSheet<String>(
      context,
      title: l10n.questionnaireGovernorateLabel,
      selected: state.verificationInfo.governorate,
      items: Governorate.all
          .map((g) => SelectionItem(value: g.key, label: g.localizedName(lang)))
          .toList(),
    );
    if (picked != null) {
      _cubit.doIntent(QuestionnaireSelectGovernorateEvent(picked));
    }
  }

  void _onNext() {
    // Shows inline errors on the text field; the cubit validates everything
    // else and only submits when the whole step is valid.
    _formKey.currentState?.validate();
    _cubit.doIntent(const QuestionnaireSubmitStep1Event());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final lang = Localizations.localeOf(context).languageCode;

    return BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
      builder: (context, state) {
        final info = state.verificationInfo;
        final showErrors = state.showStep1Errors;
        final universityError = state.universities.isError
            ? l10n.questionnaireLoadUniversitiesFailed
            : (showErrors && info.university == null
                  ? l10n.questionnaireSelectError
                  : null);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.questionnaireStep1Title, style: context.text.heading2),
            const SizedBox(height: 4),
            Text(
              l10n.questionnaireStep1Subtitle,
              style: context.text.labelDefault.copyWith(color: colors.info),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.questionnaireAllRequired,
              style: context.text.captionDefault.copyWith(
                color: colors.infoDark,
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: _nameController,
                focusNode: _nameNode,
                labelText: l10n.questionnaireFullNameLabel,
                hint: l10n.questionnaireFullNameHint,
                helperText: l10n.questionnaireFullNameHelper,
                height: 76,
                keyboardType: TextInputType.name,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                validator: AppValidators.validateFullName,
                onChange: (value) =>
                    _cubit.doIntent(QuestionnaireUpdateFullNameEvent(value)),
              ),
            ),
            const SizedBox(height: 20),
            SelectorField(
              label: l10n.questionnaireUniversityLabel,
              hint: l10n.questionnaireUniversityHint,
              value: info.university?.name,
              isLoading: state.universities.isLoading,
              errorText: universityError,
              onTap: () => _pickUniversity(state),
            ),
            const SizedBox(height: 20),
            Text(
              l10n.questionnaireAcademicYearLabel,
              style: context.text.bodyMedium,
            ),
            const SizedBox(height: 8),
            AcademicYearChips(
              selected: info.academicYear,
              hasError: showErrors,
              onSelected: (year) =>
                  _cubit.doIntent(QuestionnaireSelectAcademicYearEvent(year)),
            ),
            if (showErrors && info.academicYear == null) ...[
              const SizedBox(height: 4),
              Text(
                l10n.questionnaireSelectError,
                style: context.text.captionDefault.copyWith(
                  color: colors.error,
                ),
              ),
            ],
            const SizedBox(height: 20),
            SelectorField(
              label: l10n.questionnaireGovernorateLabel,
              hint: l10n.questionnaireGovernorateHint,
              value: Governorate.byKey(info.governorate)?.localizedName(lang),
              errorText: showErrors && info.governorate == null
                  ? l10n.questionnaireSelectError
                  : null,
              onTap: () => _pickGovernorate(state),
            ),
            const SizedBox(height: 20),
            Text(l10n.questionnaireIdCardLabel, style: context.text.bodyMedium),
            const SizedBox(height: 8),
            IdCardUpload(
              path: info.idCardPath,
              hasError: showErrors && info.idCardPath == null,
              onPick: () => _pickImage(
                (path) => _cubit.doIntent(QuestionnaireSetIdCardEvent(path)),
              ),
              onRemove: () =>
                  _cubit.doIntent(const QuestionnaireSetIdCardEvent(null)),
            ),
            if (showErrors && info.idCardPath == null) ...[
              const SizedBox(height: 4),
              Text(
                l10n.questionnaireIdCardRequiredError,
                style: context.text.captionDefault.copyWith(
                  color: colors.error,
                ),
              ),
            ],
            const SizedBox(height: 12),
            Text(
              l10n.questionnaireIdCardNote,
              style: context.text.captionDefault.copyWith(
                color: colors.infoDark,
              ),
            ),
            const SizedBox(height: 20),
            AvatarPicker(
              fullName: info.fullName,
              imagePath: info.avatarPath,
              onTap: () => _pickImage(
                (path) => _cubit.doIntent(QuestionnaireSetAvatarEvent(path)),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  flex: 125,
                  child: CustomButton(
                    title: l10n.questionnaireCancel,
                    isLoading: false,
                    height: 56,
                    backgroundColor: colors.infoHover,
                    foregroundColor: colors.info,
                    onPressed: () => confirmCancelQuestionnaire(context),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  flex: 256,
                  child: CustomButton(
                    title: l10n.questionnaireNextStep,
                    isLoading: state.step1Response.isLoading,
                    height: 56,
                    onPressed: _onNext,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
