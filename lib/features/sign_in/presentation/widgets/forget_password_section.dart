import 'package:denta/core/widgets/app_toggle.dart';
import 'package:denta/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_typography.dart';

class ForgetPasswordSection extends StatefulWidget {
  const ForgetPasswordSection({super.key});

  @override
  State<ForgetPasswordSection> createState() => _ForgetPasswordSectionState();
}

class _ForgetPasswordSectionState extends State<ForgetPasswordSection> {
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppToggle(
          value: rememberMe,
          label: AppLocalizations.of(context)!.rememberMe,
          onChanged: (value) {
            setState(() {
              rememberMe = value;
            });
          },
        ),
        CustomTextButton(
          title: AppLocalizations.of(context)!.forgotPassword,
          onPressed: () {},
          style: context.text.labelDefault,
        ),
      ],
    );
  }
}
