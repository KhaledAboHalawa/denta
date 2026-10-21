import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/onboarding/domain/repo/onboarding_repo.dart';
import 'package:injectable/injectable.dart';

import '../data_source/onboarding_data_source.dart';

@LazySingleton(as: OnboardingRepo)
class OnboardingRepoImpl implements OnboardingRepo{
  final OnboardingDataSource onboardingDataSource;
  OnboardingRepoImpl({required this.onboardingDataSource});
  @override
  Future<Result<bool>> completeOnboarding() {
    // TODO: implement completeOnboarding
    throw UnimplementedError();
  }

  @override
  Result<bool> getOnboardingStatus() {
    // TODO: implement getOnboardingStatus
    throw UnimplementedError();
  }
}