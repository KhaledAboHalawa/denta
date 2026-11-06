import 'package:flutter/material.dart';

import '../../../questionnaire/domain/entities/verification_info_params.dart';
import 'profile_avatar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ProfileAvatar(
          gender: Gender.male,
        )
      ],
    );
  }
}