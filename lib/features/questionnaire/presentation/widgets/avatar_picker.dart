import 'dart:io';

import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
    required this.fullName,
    required this.imagePath,
    required this.onTap,
  });

  final String fullName;
  final String? imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;
    final initials = initialsOf(fullName);
    final photo = imagePath;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors.secondaryLight,
                    border: Border.all(color: colors.primaryBorder, width: 0.6),
                    image: photo == null
                        ? null
                        : DecorationImage(
                            image: ResizeImage(
                              FileImage(File(photo)),
                              width: 280,
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                  child: photo != null
                      ? null
                      : initials.isEmpty
                      ? Icon(
                          Icons.person_outline,
                          size: 32,
                          color: colors.primary,
                        )
                      : Text(
                          initials,
                          style: context.text.heading3.copyWith(
                            color: colors.primary,
                          ),
                        ),
                ),
                PositionedDirectional(
                  start: 44.7,
                  top: 44.7,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: colors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppIcons.camera,
                      width: 14,
                      height: 14,
                      colorFilter: ColorFilter.mode(
                        colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.questionnaireProfilePhotoLabel,
                  style: context.text.bodyMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  photo == null
                      ? l10n.questionnaireProfilePhotoAdd
                      : l10n.questionnaireProfilePhotoChange,
                  style: context.text.captionDefault.copyWith(
                    color: colors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String initialsOf(String fullName) {
    final words = fullName
        .trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .take(2);
    return words
        .map((w) => String.fromCharCode(w.runes.first).toUpperCase())
        .join();
  }
}
