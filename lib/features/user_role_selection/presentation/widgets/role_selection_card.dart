import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import 'role_selection_section.dart';

class RoleSelectionCard extends StatelessWidget {
  const RoleSelectionCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
  });
  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: .translucent,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 96,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : context.appColors.infoHover,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isSelected
                      ? context.appColors.primaryLight
                      : context.appColors.infoLight,
                ),
                child: SvgPicture.asset(
                  role.imagePath,
                  fit: .scaleDown,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? Theme.of(context).primaryColor
                        : context.appColors.infoHover,
                    .srcIn,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                spacing: 2,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    role.getName(context),

                    style: context.text.bodyMedium.copyWith(
                      color: isSelected
                          ? Theme.of(context).primaryColor
                          : context.appColors.info,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 130,
                    child: Text(
                      role.getDescription(context),
                      overflow: .fade,
                      maxLines: 3,
                      style: context.text.captionDefault.copyWith(
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : null,
                        height: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
