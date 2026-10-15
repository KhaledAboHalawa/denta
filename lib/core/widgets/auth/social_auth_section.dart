import 'package:flutter/material.dart';

import '../../utils/app_icons.dart';
import 'social_auth_media_button.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 56,
      child: Row(
        spacing: 33,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SocialAuthMediaButton(
              iconPath: AppIcons.googleIcon,
              onTap: () {},
            ),
          ),
          Expanded(
            child: SocialAuthMediaButton(
              iconPath: AppIcons.appleIcon,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
