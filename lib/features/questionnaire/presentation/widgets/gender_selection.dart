import 'dart:developer';

import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/verification_info_params.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({
    super.key,
    this.selected,
    required this.onChanged,
    required this.error,
  });

  final Gender? selected;
  final ValueChanged<Gender> onChanged;
  final bool error;
  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 50,
      mainAxisSize: .min,
      children: [
        Text(
          AppLocalizations.of(context)!.gender,
          style: context.text.bodyMedium,
        ),
        Expanded(
          child: Row(
            spacing: 30,
            children: [
              for (final g in Gender.values)
                GenderButton(
                  isError: widget.error,
                  gender: g,
                  isSelected: widget.selected == g,
                  onPressed: widget.onChanged,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton({
    super.key,
    required this.isSelected,
    required this.gender,
    required this.onPressed,
    required this.isError,
  });
  final bool isSelected;
  final bool isError;
  final Gender gender;
  final void Function(Gender g) onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .translucent,
      onTap: () {
        onPressed(gender);
        log("is gender ${gender.name}th;is ");
      },
      child: Row(
        mainAxisSize: .min,
        crossAxisAlignment: .end,
        spacing: 12,
        children: [
          AnimatedContainer(
            height: 20,
            width: 20,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isError
                    ? context.appColors.error
                    : isSelected
                    ? context.appColors.primary
                    : context.appColors.info,
                width: 2,
              ),
            ),
            duration: const Duration(milliseconds: 250),
            child: AnimatedContainer(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? context.appColors.primary : null,
              ),
              duration: const Duration(milliseconds: 250),
            ),
          ),
          Text(gender.label(AppLocalizations.of(context)!)),
        ],
      ),
    );
  }
}
