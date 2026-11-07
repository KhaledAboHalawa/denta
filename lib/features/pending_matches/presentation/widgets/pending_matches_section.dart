import 'package:denta/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/routing/route_paths.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/pending_match_entity.dart';
import '../cubit/pending_matches_cubit.dart';
import '../utils/pending_match_navigation.dart';
import 'pending_match_card.dart';
import 'pending_matches_retry.dart';

/// Home section: a short preview of the pending matches, a "View All" link
/// to the full list, and the "Request New Case" button.
class PendingMatchesSection extends StatelessWidget {
  const PendingMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<PendingMatchesCubit>()
            ..doIntent(const PendingMatchesLoadEvent()),
      child: const _SectionBody(),
    );
  }
}

class _SectionBody extends StatelessWidget {
  const _SectionBody();

  static const _previewCount = 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PendingMatchesCubit, PendingMatchesState>(
      builder: (context, state) {
        return state.matches.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (_) => PendingMatchesRetry(
            onRetry: () => context.read<PendingMatchesCubit>().doIntent(
              const PendingMatchesLoadEvent(),
            ),
          ),
          success: (matches) => matches.isEmpty
              ? const SizedBox.shrink()
              : _Preview(matches: matches, previewCount: _previewCount),
        );
      },
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({required this.matches, required this.previewCount});

  final List<PendingMatchEntity> matches;
  final int previewCount;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final preview = matches.take(previewCount).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 8,
                children: [
                  Text(l10n.pendingMatchesTitle, style: context.text.heading3),
                  Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colors.secondaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      NumberFormat.decimalPattern(locale)
                          .format(matches.length),
                      style: context.text.bodyMedium.copyWith(
                        color: colors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => context.push(RoutePaths.pendingMatchesPath),
                child: Text(
                  l10n.viewAll,
                  style: context.text.captionDefault.copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: colors.info,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: preview.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final match = preview[index];
              return PendingMatchCard(
                match: match,
                onViewDetails: () => context.openMatchDetails(match.id),
                onEdit: () => context.editMatch(match.id),
              );
            },
          ),
        ),
      ],
    );
  }
}
