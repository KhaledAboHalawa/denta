import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/routing/route_paths.dart';
import 'package:denta/core/shared/auth/shared_presentation/widgets/slide_switcher.dart';
import 'package:denta/features/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:denta/features/questionnaire/presentation/widgets/profile_extras_form.dart';
import 'package:denta/features/questionnaire/presentation/widgets/step_progress_header.dart';
import 'package:denta/features/questionnaire/presentation/widgets/verification_info_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuestionnaireBody extends StatelessWidget {
  const QuestionnaireBody({super.key});

  void _showError(BuildContext context, String? message) {
    if (message == null) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QuestionnaireCubit, QuestionnaireState>(
      listenWhen: (prev, curr) =>
          prev.step1Response != curr.step1Response ||
          prev.step2Response != curr.step2Response,
      listener: (context, state) {
        if (state.step1Response.isError) {
          _showError(context, state.step1Response.error);
        }
        if (state.step2Response.isError) {
          _showError(context, state.step2Response.error);
        }
        if (state.step2Response.isSuccess) {
          // TODO: send the user to the real next destination once it exists
          // (home / "verification pending" screen).
          context.goNamed(RoutePaths.signInPath);
        }
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
            child: BlocBuilder<QuestionnaireCubit, QuestionnaireState>(
              buildWhen: (prev, curr) => prev.stepIndex != curr.stepIndex,
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StepProgressHeader(
                      currentStep: state.stepIndex,
                      onStepTap: (index) => context
                          .read<QuestionnaireCubit>()
                          .doIntent(QuestionnaireGoToStepEvent(index)),
                    ),
                    const SizedBox(height: 24),
                    SlideSwitcher(
                      index: state.stepIndex,
                      children: const [
                        VerificationInfoForm(),
                        ProfileExtrasForm(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
