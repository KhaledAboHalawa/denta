
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routing/route_paths.dart';

Future<void> confirmCancelQuestionnaire(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  final discard = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(l10n.questionnaireDiscardTitle),
      content: Text(l10n.questionnaireDiscardMessage),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      actionsAlignment: .spaceBetween,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: Text(l10n.questionnaireKeepEditing),
        ),
        TextButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(l10n.questionnaireDiscardConfirm),
        ),
      ],
    ),
  );
  if (discard != true || !context.mounted) return;
  if (context.canPop()) {
    context.pop();
  } else {
    context.go(RoutePaths.signInPath);
  }
}
