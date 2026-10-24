import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Read-only field that looks like the text fields but opens a picker.
class SelectorField extends StatelessWidget {
  const SelectorField({
    super.key,
    required this.label,
    required this.hint,
    required this.onTap,
    this.value,
    this.errorText,
    this.isLoading = false,
  });

  final String label;
  final String hint;
  final String? value;
  final String? errorText;
  final bool isLoading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final hasError = errorText != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.text.bodyMedium),
        const SizedBox(height: 6),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: hasError ? colors.error : colors.info),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value ?? hint,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: value == null
                        ? context.text.captionDefault
                        : context.text.bodyDefault,
                  ),
                ),
                const SizedBox(width: 10),
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  SvgPicture.asset(
                    AppIcons.chevronDown,
                    width: 24,
                    height: 24,
                    colorFilter: ColorFilter.mode(colors.info, BlendMode.srcIn),
                  ),
              ],
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: context.text.captionDefault.copyWith(color: colors.error),
          ),
        ],
      ],
    );
  }
}
