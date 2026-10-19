import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../theme/app_colors.dart';

class SocialAuthMediaButton extends StatelessWidget {
  const SocialAuthMediaButton({super.key, required this.iconPath, this.onTap});
  final String iconPath;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: .translucent,
      child: Container(
        height: 56,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.appColors.infoHover, width: 1),
        ),
        child: SvgPicture.asset(iconPath, fit: BoxFit.scaleDown),
      ),
    );
  }
}
