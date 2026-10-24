import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

String fileNameOf(String path) => path.split(RegExp(r'[\\/]')).last;

/// First letter of the first two words, e.g. "Mona Daoud" -> "MD".
String initialsOf(String fullName) {
  final words = fullName
      .trim()
      .split(RegExp(r'\s+'))
      .where((w) => w.isNotEmpty)
      .take(2);
  return words
      .map((w) => String.fromCharCode(w.runes.first).toUpperCase())
      .join();
}

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
