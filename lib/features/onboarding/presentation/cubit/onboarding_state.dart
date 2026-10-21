import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int pageIndex;
  final bool onboardingComplented;
  const OnboardingState.initial()
    : this(pageIndex: 0, onboardingComplented: false);
  const OnboardingState({
    this.pageIndex = 0,
    this.onboardingComplented = false,
  });

  @override
  List<Object?> get props => [pageIndex, onboardingComplented];

  OnboardingState copyWith({int? pageIndex, bool? onboardingComplented}) =>
      OnboardingState(
        pageIndex: pageIndex ?? this.pageIndex,
        onboardingComplented: onboardingComplented ?? this.onboardingComplented,
      );
}
