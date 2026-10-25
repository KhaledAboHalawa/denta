import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FileChip extends StatelessWidget {
  const FileChip({super.key, required this.label, required this.onRemove});

  final String label;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      constraints: const BoxConstraints(maxWidth: 220),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
      decoration: BoxDecoration(
        color: colors.secondaryLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.text.labelDefault.copyWith(color: colors.primary),
            ),
          ),
          const SizedBox(width: 4),
          CircleCloseButton(onTap: onRemove),
        ],
      ),
    );
  }
}

/// Small round "x" used on chips and thumbnails.
class CircleCloseButton extends StatelessWidget {
  const CircleCloseButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(color: colors.secondary, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: SvgPicture.asset(
          AppIcons.close,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
        ),
      ),
    );
  }
}
