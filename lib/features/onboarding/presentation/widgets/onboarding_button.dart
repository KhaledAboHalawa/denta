import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/utils/app_icons.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      height: 67,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: AppPalette.white,
          foregroundColor: AppPalette.primary,
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: SvgPicture.asset(
          AppIcons.chevronRight,
          width: 47,
          height: 47,
          colorFilter: .mode(AppPalette.primary, .srcIn),
        ),
      ),
    );
  }
}
