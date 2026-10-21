import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppToggle extends StatelessWidget {
  const AppToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final enabled = onChanged != null;

    return Semantics(
      toggled: value,
      label: label,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: enabled ? () => onChanged!(!value) : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ToggleBase(value: value),
            if (label != null) ...[
              const SizedBox(width: 8),
              Text(label!, style: context.text.labelDefault),
            ],
          ],
        ),
      ),
    );
  }
}

class _ToggleBase extends StatelessWidget {
  const _ToggleBase({required this.value});

  final bool value;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: 36,
      height: 20,
      padding: const EdgeInsets.all(2),
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      decoration: BoxDecoration(
        color: value
            ? Theme.of(context).primaryColor
            : context.appColors.infoHover,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: context.appColors.infoLight,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0x0F000000),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
            BoxShadow(
              color: Color(0x00000000),
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
      ),
    );
  }
}
