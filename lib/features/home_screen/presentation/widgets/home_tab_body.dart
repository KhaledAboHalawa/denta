import 'package:flutter/material.dart';

import '../../../questionnaire/domain/entities/verification_info_params.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import 'active_cases_widget.dart';
import 'home_header.dart';

class HomeTabBody extends StatelessWidget {
  const HomeTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 24),
      child: const Column(
        spacing: 18,
        children: [
          // TODO: replace with the signed-in user's data once it exists.
          HomeHeader(
            name: 'Ali El-Alfy',
            role: UserRole.dentist,
            gender: Gender.male,
          ),
          ActiveCasesWidget(),
        ],
      ),
    );
  }
}
