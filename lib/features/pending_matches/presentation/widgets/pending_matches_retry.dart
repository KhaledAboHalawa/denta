import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Tap-to-retry message shown when loading pending matches fails.
class PendingMatchesRetry extends StatelessWidget {
  const PendingMatchesRetry({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onRetry,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            AppLocalizations.of(context)!.pendingMatchesLoadFailed,
            textAlign: TextAlign.center,
            style: context.text.bodyDefault.copyWith(
              color: context.appColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
