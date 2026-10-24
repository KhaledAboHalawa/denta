import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class StepProgressHeader extends StatelessWidget {
  const StepProgressHeader({
    super.key,
    required this.currentStep,
    this.totalSteps = 2,
    this.onStepTap,
  });

  /// Zero-based index of the current step.
  final int currentStep;
  final int totalSteps;

  /// Called with the tapped step index (only steps up to the current one).
  final ValueChanged<int>? onStepTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.questionnaireStepOf(currentStep + 1, totalSteps),
          style: context.text.labelDefault,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            for (var i = 0; i < totalSteps; i++) ...[
              if (i > 0) const SizedBox(width: 10),
              Expanded(
                child: _Segment(
                  completed: i <= currentStep,
                  onTap: onStepTap != null && i <= currentStep
                      ? () => onStepTap!(i)
                      : null,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({required this.completed, this.onTap});

  final bool completed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        height: 16,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 4,
            decoration: BoxDecoration(
              color: completed
                  ? context.appColors.primary
                  : context.appColors.secondary,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
