import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_case/save_onboarding_completion_use_case.dart';
import 'onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  final SaveOnboardingCompletionUseCase saveOnboardingCompletionUseCase;
  OnboardingCubit(this.saveOnboardingCompletionUseCase)
    : super(OnboardingState.initial());

  void gotoNextPage() async {
    if (state.pageIndex < 3) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
    } else {
      final result = await saveOnboardingCompletionUseCase();
      result.when(
        success: (data) => emit(state.copyWith(onboardingComplented: true)),
        error: (error) {},
      );
    }
  }

  void skipOnboarding() async {
    final result = await saveOnboardingCompletionUseCase();
    result.when(
      success: (data) => emit(state.copyWith(onboardingComplented: true)),
      error: (error) {},
    );
  }
}
