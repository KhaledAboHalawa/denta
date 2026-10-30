import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/features/questionnaire/presentation/cubit/questionnaire_cubit.dart';
import 'package:denta/features/questionnaire/presentation/widgets/questionnaire_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionnaireScreen extends StatelessWidget {
  const QuestionnaireScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) =>
            getIt<QuestionnaireCubit>()
              ..doIntent(const QuestionnaireLoadUniversitiesEvent()),
        child: const QuestionnaireBody(),
      ),
    );
  }
}