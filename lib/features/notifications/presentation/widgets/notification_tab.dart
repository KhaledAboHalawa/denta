import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({
    required this.title,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 38,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 24,
            child: Center(
              child: Text(
                title,
                style: context.text.bodyMedium.copyWith(
                  color: selected ? colors.primary : colors.info,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
