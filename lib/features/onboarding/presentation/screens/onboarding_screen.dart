import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routing/route_paths.dart';
import '../cubit/onboarding_cubit.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onbording_header.dart';
import '../widgets/slideShowSection.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = getIt<OnboardingCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: cubit,
        child: BlocConsumer<OnboardingCubit, OnboardingState>(
          listenWhen: (previous, current) {
            return previous.onboardingComplented !=
                current.onboardingComplented;
          },
          listener: (context, state) {
            if (state.onboardingComplented) {
              context.pushReplacement(RoutePaths.roleSelectionPath);
            }
          },
          buildWhen: (previous, current) {
            return previous.pageIndex != current.pageIndex;
          },
          builder: (context, state) {
            return Stack(
              children: [
                SlidShowSection(currentPage: state.pageIndex),
                OnboardingHeader(
                  onSkip: () {
                    cubit.gotoNextPage();
                  },
                  showSkip: state.pageIndex != 0 || state.pageIndex != 3,
                ),
                Align(
                  alignment: .bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 24,
                    ),
                    child: OnboardingContent(currentIndex: state.pageIndex),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
