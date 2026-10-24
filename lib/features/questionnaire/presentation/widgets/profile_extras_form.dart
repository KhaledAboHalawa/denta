import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:denta/core/widgets/custom_text_button.dart';
import 'package:denta/core/widgets/custom_text_field.dart';
import 'package:denta/features/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:denta/core/utils/media_picker.dart';
import 'package:denta/features/questionnaire/presentation/utils/questionnaire_helpers.dart';
import 'package:denta/features/questionnaire/presentation/widgets/case_photos_grid.dart';
import 'package:denta/features/questionnaire/presentation/widgets/file_chip.dart';
import 'package:denta/features/questionnaire/presentation/widgets/upload_drop_zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Step 2: optional profile extras (bio, certifications, case photos).
class ProfileExtrasForm extends StatefulWidget {
  const ProfileExtrasForm({super.key});

  static const int maxBioLength = 250;
  static const int maxCertifications = 5;
  static const int maxCasePhotos = 10;

  @override
  State<ProfileExtrasForm> createState() => _ProfileExtrasFormState();
}

class _ProfileExtrasFormState extends State<ProfileExtrasForm> {
  late final QuestionnaireCubit _cubit;
  late final TextEditingController _bioController;
  late final FocusNode _bioNode;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<QuestionnaireCubit>();
    _bioController = TextEditingController(text: _cubit.state.bio);
    _bioNode = FocusNode();
  }

  @override
  void dispose() {
    _bioController.dispose();
    _bioNode.dispose();
    super.dispose();
  }

  List<String> _merge(List<String> current, List<String> picked, int max) {
    final merged = [...current, ...picked.where((p) => !current.contains(p))];
    if (merged.length > max) {
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.questionnaireMaxFilesReached(max))),
      );
      return merged.take(max).toList();
    }
    return merged;
  }

  Future<void> _addCertifications() async {
    final picked = await MediaPicker.pickPdfs();
    if (picked.isEmpty || !mounted) return;
    _cubit.doIntent(
      QuestionnaireSetCertificationsEvent(
        _merge(
          _cubit.state.certificationPaths,
          picked,
          ProfileExtrasForm.maxCertifications,
        ),
      ),
    );
  }

  Future<void> _addCasePhotos() async {
    final picked = await MediaPicker.pickImages();
    if (picked.isEmpty || !mounted) return;
    _cubit.doIntent(
      QuestionnaireSetCasePhotosEvent(
        _merge(
          _cubit.state.casePhotoPaths,
          picked,
          ProfileExtrasForm.maxCasePhotos,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.questionnaireStep2Title, style: context.text.heading2),
        const SizedBox(height: 4),
        Text(
          l10n.questionnaireStep2Subtitle,
          style: context.text.labelDefault.copyWith(color: colors.info),
        ),
        const SizedBox(height: 20),
        // Bio with the live counter on the label row.
        Stack(
          children: [
            CustomTextField(
              controller: _bioController,
              focusNode: _bioNode,
              labelText: l10n.questionnaireBioLabel,
              hint: l10n.questionnaireBioHint,
              height: 101,
              maxLines: 5,
              maxLength: ProfileExtrasForm.maxBioLength,
              reserveHelperSpace: false,
              keyboardType: TextInputType.multiline,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 18,
              ),
              onChange: (value) =>
                  _cubit.doIntent(QuestionnaireUpdateBioEvent(value)),
            ),
            PositionedDirectional(
              top: 4,
              end: 0,
              child: BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
                buildWhen: (prev, curr) => prev.bio != curr.bio,
                builder: (context, state) => Text(
                  '${state.bio.length}/${ProfileExtrasForm.maxBioLength}',
                  style: context.text.captionDefault,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          l10n.questionnaireCertificationsLabel,
          style: context.text.bodyMedium,
        ),
        const SizedBox(height: 8),
        UploadDropZone(
          dashed: false,
          iconAsset: AppIcons.plus,
          label: l10n.questionnaireAddCertification,
          onTap: _addCertifications,
        ),
        BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
          buildWhen: (prev, curr) =>
              prev.certificationPaths != curr.certificationPaths,
          builder: (context, state) {
            if (state.certificationPaths.isEmpty) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final path in state.certificationPaths)
                    FileChip(
                      label: fileNameOf(path),
                      onRemove: () => _cubit.doIntent(
                        QuestionnaireSetCertificationsEvent(
                          state.certificationPaths
                              .where((p) => p != path)
                              .toList(),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 20),
        Text(
          l10n.questionnaireCasePhotosLabel,
          style: context.text.bodyMedium,
        ),
        const SizedBox(height: 8),
        UploadDropZone(
          iconAsset: AppIcons.image,
          label: l10n.questionnaireUploadCasePhotos,
          onTap: _addCasePhotos,
        ),
        BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
          buildWhen: (prev, curr) => prev.casePhotoPaths != curr.casePhotoPaths,
          builder: (context, state) {
            if (state.casePhotoPaths.isEmpty) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: CasePhotosGrid(
                paths: state.casePhotoPaths,
                onRemove: (path) => _cubit.doIntent(
                  QuestionnaireSetCasePhotosEvent(
                    state.casePhotoPaths.where((p) => p != path).toList(),
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              AppIcons.shieldAlert,
              width: 17,
              height: 17,
              colorFilter: ColorFilter.mode(colors.infoDark, BlendMode.srcIn),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                l10n.questionnairePrivacyNote,
                style: context.text.captionDefault.copyWith(
                  color: colors.infoDark,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
          buildWhen: (prev, curr) => prev.step2Response != curr.step2Response,
          builder: (context, state) => CustomButton(
            title: l10n.questionnaireSaveAndContinue,
            isLoading: state.step2Response.isLoading,
            height: 56,
            onPressed: () =>
                _cubit.doIntent(const QuestionnaireSubmitStep2Event()),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: CustomTextButton(
            title: l10n.questionnaireSkipForNow,
            style: context.text.labelDefault.copyWith(color: colors.primary),
            onPressed: () =>
                _cubit.doIntent(const QuestionnaireSkipStep2Event()),
          ),
        ),
      ],
    );
  }
}
