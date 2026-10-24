import 'dart:io';

import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:denta/features/questionnaire/presentation/utils/questionnaire_helpers.dart';
import 'package:denta/features/questionnaire/presentation/widgets/file_chip.dart';
import 'package:denta/features/questionnaire/presentation/widgets/upload_drop_zone.dart';
import 'package:flutter/material.dart';

/// Empty: dashed upload zone. Filled: small preview tile (tap to replace).
class IdCardUpload extends StatelessWidget {
  const IdCardUpload({
    super.key,
    required this.path,
    required this.onPick,
    required this.onRemove,
    this.hasError = false,
  });

  final String? path;
  final VoidCallback onPick;
  final VoidCallback onRemove;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final filePath = path;

    if (filePath == null) {
      return UploadDropZone(
        iconAsset: AppIcons.upload,
        label: l10n.questionnaireIdCardUpload,
        onTap: onPick,
        hasError: hasError,
      );
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPick,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: colors.secondaryLight,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: colors.primaryBorder, width: 0.8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.file(
                File(filePath),
                width: 64,
                height: 44,
                fit: BoxFit.cover,
                cacheWidth: 256,
                errorBuilder: (_, _, _) => Container(
                  width: 64,
                  height: 44,
                  color: colors.secondary,
                  child: Icon(Icons.badge_outlined, color: colors.primary),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                fileNameOf(filePath),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: context.text.labelDefault.copyWith(
                  color: colors.primary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleCloseButton(onTap: onRemove),
          ],
        ),
      ),
    );
  }
}
