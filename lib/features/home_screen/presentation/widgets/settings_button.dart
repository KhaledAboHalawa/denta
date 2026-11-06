import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_icons.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Material(
      color: colors.secondaryLight,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox.square(
          dimension: 50,
          child: Center(
            child: SvgPicture.asset(
              AppIcons.settings,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
