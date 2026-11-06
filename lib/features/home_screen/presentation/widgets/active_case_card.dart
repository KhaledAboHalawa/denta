import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../../core/widgets/custom_button.dart';

/// Home card that summarizes the student's current active case.
///
/// UI-only for now: it takes plain values until the backend contract for
/// cases is final.
class ActiveCaseCard extends StatelessWidget {
  const ActiveCaseCard({
    super.key,
    required this.caseTitle,
    required this.patientName,
    required this.clinicName,
    required this.appointment,
    required this.currentVisit,
    required this.totalVisits,
    required this.progress,
    required this.onLogSession,
  }) : assert(progress >= 0 && progress <= 1);

  final String caseTitle;
  final String patientName;
  final String clinicName;
  final DateTime appointment;
  final int currentVisit;
  final int totalVisits;

  /// Case progress from 0.0 to 1.0.
  final double progress;
  final VoidCallback? onLogSession;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).toString();

    final captionOnDark = context.text.captionDefault.copyWith(
      color: colors.secondary,
    );
    final captionWhite = context.text.captionDefault.copyWith(
      color: colors.white,
    );

    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: colors.dentaGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.35),
            offset: const Offset(0, 3),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  l10n.currentActiveCase,
                  style: captionOnDark,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              Container(
                height: 25,
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.glassLight.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  l10n.visitProgress(currentVisit, totalVisits),
                  style: captionWhite,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            caseTitle,
            style: context.text.heading2.copyWith(color: colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            l10n.patientLabel(patientName),
            style: captionOnDark,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              _IconLabel(
                icon: AppIcons.mapPin,
                label: clinicName,
                style: captionWhite,
              ),
              _IconLabel(
                icon: AppIcons.calendarRange,
                label: DateFormat.MMMEd(locale).add_jm().format(appointment),
                style: captionWhite,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.caseProgress, style: captionOnDark),
              Text(
                NumberFormat.percentPattern(locale).format(progress),
                style: captionOnDark,
              ),
            ],
          ),
          const SizedBox(height: 8),
          _ProgressBar(progress: progress, color: colors.white),
          const SizedBox(height: 20),
          CustomButton(
            isLoading: false,
            title: l10n.logSession,
            onPressed: onLogSession,
            backgroundColor: colors.white,
            foregroundColor: colors.primary,
            height: 56,
          ),
        ],
      ),
    );
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.icon,
    required this.label,
    required this.style,
  });

  final String icon;
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        SvgPicture.asset(icon, width: 16, height: 16),
        Flexible(child: Text(label, style: style)),
      ],
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({required this.progress, required this.color});

  final double progress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const radius = 3.726;
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: FractionallySizedBox(
        alignment: AlignmentDirectional.centerStart,
        widthFactor: progress,
        heightFactor: 7.452 / 8,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
