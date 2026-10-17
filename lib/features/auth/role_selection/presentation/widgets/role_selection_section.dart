import 'package:denta/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/l10n/app_localizations.dart';
import '../../../../../core/routing/route_paths.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'role_selection_card.dart';

enum UserRole {
  patient,
  dentist;

  String getName(BuildContext context) {
    switch (this) {
      case UserRole.patient:
        return AppLocalizations.of(context)!.patient;
      case UserRole.dentist:
        return AppLocalizations.of(context)!.dentist;
    }
  }

  String getDescription(BuildContext context) {
    switch (this) {
      case UserRole.patient:
        return AppLocalizations.of(context)!.patientDesc;
      case UserRole.dentist:
        return AppLocalizations.of(context)!.dentistDesc;
    }
  }

  String get imagePath {
    switch (this) {
      case UserRole.patient:
        return AppIcons.patient;
      case UserRole.dentist:
        return AppIcons.dentist;
    }
  }
}

class RoleSelectionSection extends StatefulWidget {
  const RoleSelectionSection({super.key});

  @override
  State<RoleSelectionSection> createState() => _RoleSelectionSectionState();
}

class _RoleSelectionSectionState extends State<RoleSelectionSection> {
  UserRole? selectedRole;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        spacing: 24,
        children: [
          ...UserRole.values.map(
            (e) => RoleSelectionCard(
              role: e,
              isSelected: selectedRole == e,
              onTap: () {
                setState(() {
                  selectedRole = e;
                });
              },
            ),
          ),
          CustomButton(
            onPressed: selectedRole == null
                ? null
                : () {
                    context.push(RoutePaths.registerPath);
                  },
            title: AppLocalizations.of(context)!.continueButton,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}
