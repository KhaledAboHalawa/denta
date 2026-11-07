import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';
import '../../domain/entities/pending_match_entity.dart';
import 'match_status_label.dart';

/// One pending match. Its status decides what the student can do:
/// - searching for patients: the whole card opens the details (view only).
/// - needs adjustments: only "Edit" is active, and it goes back to the
///   case request.
class PendingMatchCard extends StatelessWidget {
  const PendingMatchCard({
    super.key,
    required this.match,
    required this.onViewDetails,
    required this.onEdit,
  });

  final PendingMatchEntity match;
  final VoidCallback onViewDetails;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();
    final isSearching = match.status == PendingMatchStatus.searchingForPatients;
    final date = DateFormat.yMMMd(locale).format(match.requestedAt);

    return Material(
      color: colors.background,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colors.primaryActive, width: 0.8),
      ),
      child: GestureDetector(
        onTap: isSearching ? onViewDetails : null,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MatchStatusLabel(status: match.status),
                  if (isSearching)
                    SvgPicture.asset(
                      AppIcons.arrowRight,
                      width: 20,
                      height: 20,
                      matchTextDirection: true,
                      colorFilter: ColorFilter.mode(
                        colors.info,
                        BlendMode.srcIn,
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: onEdit,
                      child: Text(
                        l10n.edit,
                        style: context.text.labelDefault.copyWith(
                          color: colors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: colors.primary,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                match.title,
                style: context.text.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _MetaItem(
                    icon: AppIcons.mapPin,
                    child: Text(
                      match.location,
                      style: context.text.captionDefault,
                    ),
                  ),
                  _MetaItem(
                    icon: AppIcons.calendarRange,
                    child: _RequestedOn(date: date),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.child});

  final String icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        SvgPicture.asset(
          icon,
          width: 16,
          height: 16,
          colorFilter: ColorFilter.mode(
            context.appColors.info,
            BlendMode.srcIn,
          ),
        ),
        Flexible(child: child),
      ],
    );
  }
}

/// "Requested on <date>" with only the date in semi-bold, in any language.
class _RequestedOn extends StatelessWidget {
  const _RequestedOn({required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    final style = context.text.captionDefault;
    final text = AppLocalizations.of(context)!.requestedOn(date);
    final index = text.indexOf(date);
    if (index < 0) return Text(text, style: style);

    return Text.rich(
      TextSpan(
        style: style,
        children: [
          TextSpan(text: text.substring(0, index)),
          TextSpan(
            text: date,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          TextSpan(text: text.substring(index + date.length)),
        ],
      ),
    );
  }
}
