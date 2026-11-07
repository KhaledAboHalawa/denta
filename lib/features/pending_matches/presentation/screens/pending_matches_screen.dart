import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../cubit/pending_matches_cubit.dart';
import '../widgets/pending_matches_body.dart';

class PendingMatchesScreen extends StatelessWidget {
  const PendingMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.pendingMatchesTitle,
      ),
      body: BlocProvider(
        create: (_) =>
            getIt<PendingMatchesCubit>()
              ..doIntent(const PendingMatchesLoadEvent()),
        child: const PendingMatchesBody(),
      ),
    );
  }
}
