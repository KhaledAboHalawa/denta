import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/features/questionnaire/domain/entities/academic_year.dart';
import 'package:flutter/material.dart';

class AcademicYearChips extends StatelessWidget {
  const AcademicYearChips({
    super.key,
    required this.selected,
    required this.onSelected,
    this.hasError = false,
  });

  final AcademicYear? selected;
  final ValueChanged<AcademicYear> onSelected;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.appColors;

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final year in AcademicYear.values)
          GestureDetector(
            onTap: () => onSelected(year),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              constraints: const BoxConstraints(minWidth: 52),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
              decoration: BoxDecoration(
                color: year == selected ? colors.primary : colors.inputFill,
                borderRadius: BorderRadius.circular(12),
                border: hasError && selected == null
                    ? Border.all(color: colors.error)
                    : null,
              ),
              child: Text(
                academicYearLabel(l10n, year),
                textAlign: TextAlign.center,
                style: context.text.labelDefault.copyWith(
                  color: year == selected ? colors.white : colors.info,
                ),
              ),
            ),
          ),
      ],
    );
  }
  
String academicYearLabel(AppLocalizations l10n, AcademicYear year) {
  return switch (year) {
    AcademicYear.first => l10n.questionnaireYear1,
    AcademicYear.second => l10n.questionnaireYear2,
    AcademicYear.third => l10n.questionnaireYear3,
    AcademicYear.fourth => l10n.questionnaireYear4,
    AcademicYear.fifth => l10n.questionnaireYear5,
    AcademicYear.intern => l10n.questionnaireYearIntern,
  };
}

}
