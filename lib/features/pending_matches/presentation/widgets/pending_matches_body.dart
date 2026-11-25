import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/pending_match_entity.dart';
import '../cubit/pending_matches_cubit.dart';
import '../utils/pending_match_navigation.dart';
import '../utils/pending_match_placeholders.dart';
import 'pending_match_card.dart';
import 'pending_matches_retry.dart';

class PendingMatchesBody extends StatelessWidget {
  const PendingMatchesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingMatchesCubit, PendingMatchesState>(
      builder: (context, state) {
        return state.matches.when(
          initial: () => const SizedBox.shrink(),
          loading: () =>
              Skeletonizer(child: _MatchesList(matches: pendingMatchPlaceholders)),
          error: (_) => PendingMatchesRetry(
            onRetry: () => context.read<PendingMatchesCubit>().doIntent(
              const PendingMatchesLoadEvent(),
            ),
          ),
          success: (matches) {
            if (matches.isEmpty) {
              return Center(
                child: Text(
                  AppLocalizations.of(context)!.pendingMatchesEmpty,
                  style: context.text.bodyDefault,
                ),
              );
            }
            return _MatchesList(matches: matches);
          },
        );
      },
    );
  }
}

class _MatchesList extends StatelessWidget {
  const _MatchesList({required this.matches});

  final List<PendingMatchEntity> matches;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      itemCount: matches.length,
      separatorBuilder: (_, _) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final match = matches[index];
        return PendingMatchCard(
          match: match,
          onViewDetails: () => context.openMatchDetails(match.id),
          onEdit: () => context.editMatch(match.id),
        );
      },
    );
  }
}
