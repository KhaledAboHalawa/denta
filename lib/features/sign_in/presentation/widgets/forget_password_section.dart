import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/widgets/app_toggle.dart';
import 'package:denta/core/widgets/custom_text_button.dart';
import 'package:denta/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/theme/app_typography.dart';

class ForgetPasswordSection extends StatefulWidget {
  const ForgetPasswordSection({super.key});

  @override
  State<ForgetPasswordSection> createState() => _ForgetPasswordSectionState();
}

class _ForgetPasswordSectionState extends State<ForgetPasswordSection> {
  late final SignInCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = getIt<SignInCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<SignInCubit, SignInState>(
          buildWhen: (previous, current) =>
              previous.rememberMe != current.rememberMe,
          builder: (context, state) {
            return AppToggle(
              value: state.rememberMe,
              label: AppLocalizations.of(context)!.rememberMe,
              onChanged: (value) {
                _cubit.doIntent(const SignInRememberMeChangedEvent());
              },
            );
          },
        ),
        CustomTextButton(
          title: AppLocalizations.of(context)!.forgotPassword,
          onPressed: () {
            context.pushNamed(RoutePaths.forgetPasswordPath);
          },
          style: context.text.labelDefault,
        ),
      ],
    );
  }
}
