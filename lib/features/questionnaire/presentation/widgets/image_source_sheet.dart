import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_icons.dart';

/// Asks whether to take a photo or pick one from the gallery.
Future<ImageSource?> showImageSourceSheet(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  final colors = context.appColors;
  return showModalBottomSheet<ImageSource>(
    context: context,
    showDragHandle: true,
    backgroundColor: colors.background,
    builder: (sheetContext) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset(
              AppIcons.camera,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
            title: Text(
              l10n.questionnaireTakePhoto,
              style: sheetContext.text.bodyDefault,
            ),
            onTap: () => Navigator.of(sheetContext).pop(ImageSource.camera),
          ),
          ListTile(
            leading: Icon(Icons.photo_library_outlined, color: colors.primary),
            title: Text(
              l10n.questionnaireChooseFromGallery,
              style: sheetContext.text.bodyDefault,
            ),
            onTap: () => Navigator.of(sheetContext).pop(ImageSource.gallery),
          ),
        ],
      ),
    ),
  );
}
