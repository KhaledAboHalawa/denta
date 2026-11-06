import 'package:denta/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_indicator.dart';
import 'active_case_card.dart';

class ActiveCasesWidget extends StatefulWidget {
  const ActiveCasesWidget({super.key});

  @override
  State<ActiveCasesWidget> createState() => _ActiveCasesWidgetState();
}

class _ActiveCasesWidgetState extends State<ActiveCasesWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        SizedBox(
          height: 280,

          child: PageView.builder(
            onPageChanged: (value) => setState(() {
              _currentIndex = value;
            }),
            itemBuilder: (context, index) => ActiveCaseCard(
              caseTitle: 'Root Canal Treatment',
              patientName: 'Salma Rashed',
              clinicName: 'Alexandria Clinic',
              appointment: DateTime(2026, 10, 18, 15),
              currentVisit: 4,
              totalVisits: 6,
              progress: 0.66,
              onLogSession: () {},
            ),
          ),
        ),
        AppIndicator(
          currentIndex: _currentIndex,
          selected: context.appColors.primary,
          unSelected: context.appColors.primaryLight,
        ),
      ],
    );
  }
}
