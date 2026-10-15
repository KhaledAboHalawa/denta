import 'package:denta/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../theme/app_typography.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 20,
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: Divider(height: 1, color: context.appColors.infoLight),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Or $title with",
              style: context.text.bodyDefault.copyWith(
                color: context.appColors.info,
              ),
            ),
          ),
          Expanded(
            child: Divider(height: 1, color: context.appColors.infoLight),
          ),
        ],
      ),
    );
  }
}
