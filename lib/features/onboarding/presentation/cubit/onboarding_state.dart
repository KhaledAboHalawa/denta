import 'package:equatable/equatable.dart';
class OnboardingState extends Equatable {
  final int pageIndex;

  const OnboardingState.initial() : this(pageIndex: 0);
  const OnboardingState({this.pageIndex = 0});

  @override
  List<Object?> get props => [pageIndex];

  OnboardingState copyWith({int? pageIndex}) => OnboardingState(pageIndex: pageIndex ?? this.pageIndex);
}