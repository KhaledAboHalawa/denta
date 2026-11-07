import 'package:denta/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';

/// TODO: placeholder. This should open the case request form pre-filled
/// with the match so the student can apply the requested adjustments.
class EditMatchScreen extends StatelessWidget {
  const EditMatchScreen({super.key, required this.matchId});

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.editMatchTitle,
      ),
      body: Center(child: Text(matchId)),
    );
  }
}
