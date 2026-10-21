import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'onboarding_state.dart';

@lazySingleton
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  void gotoNextPage() {
    if (state.pageIndex != 3) {
      emit(state.copyWith(pageIndex: state.pageIndex + 1));
    }
  }

  void gotoPreviousPage() {
    if (state.pageIndex != 0) {
      emit(state.copyWith(pageIndex: state.pageIndex - 1));
    }
  }
}
