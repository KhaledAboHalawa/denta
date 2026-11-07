import 'package:denta/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';

/// TODO: placeholder until the match details design is ready.
class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key, required this.matchId});

  final String matchId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.matchDetailsTitle,
      ),
      body: Center(child: Text(matchId)),
    );
  }
}
