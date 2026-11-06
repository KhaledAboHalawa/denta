import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../questionnaire/domain/entities/verification_info_params.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import 'profile_avatar.dart';
import 'settings_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.name,
    required this.role,
    required this.gender,
    this.imageUrl,
    this.onSettingsTap,
  });

  final String name;
  final UserRole role;
  final Gender gender;
  final String? imageUrl;
  final VoidCallback? onSettingsTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final title = role.title(l10n, gender);
    final displayName = title.isEmpty ? name : '$title $name';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: imageUrl, gender: gender),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.homeGreeting,
                  style: context.text.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  displayName,
                  style: context.text.heading3,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SettingsButton(onTap: onSettingsTap),
        ],
      ),
    );
  }
}
