import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_typography.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: Divider(height: 1, color: context.appColors.infoHover),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "${AppLocalizations.of(context)!.or} $title ${AppLocalizations.of(context)!.withh}",
              style: context.text.bodyDefault.copyWith(
                color: context.appColors.info,
              ),
            ),
          ),
          Expanded(
            child: Divider(height: 1, color: context.appColors.infoHover),
          ),
        ],
      ),
    );
  }
}
