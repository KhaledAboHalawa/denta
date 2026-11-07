import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../pending_matches/presentation/widgets/pending_matches_section.dart';
import '../../../questionnaire/domain/entities/verification_info_params.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import 'active_cases_widget.dart';
import 'home_header.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final padding = MediaQuery.of(context).padding;

    return Padding(
      padding: EdgeInsets.only(top: padding.top + 24),
      child: Column(
        spacing: 12,
        children: [
          // TODO: replace with the signed-in user's data once it exists.
          const HomeHeader(
            name: 'Ali El-Alfy',
            role: UserRole.dentist,
            gender: Gender.male,
          ),
          ActiveCasesWidget(casesCount: 4, onRequestCase: () {}),
          const Expanded(child: PendingMatchesSection()),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, padding.bottom + 8),
            child: CustomButton(
              isLoading: false,
              height: 56,
              title: l10n.requestNewCase,
              // TODO: open the new case request flow once it exists.
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
