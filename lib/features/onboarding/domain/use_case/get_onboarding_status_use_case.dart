import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/features/onboarding/data/data_source/onboarding_data_source.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOnboardingStatusUseCase {
  GetOnboardingStatusUseCase({required this.onboardingDataSource});
  final OnboardingDataSource onboardingDataSource;

  Result<bool> call() => onboardingDataSource.getOnboardingStatus();
}
