import 'package:denta/core/config/base_response/result.dart';

abstract class OnboardingRepo {
  Future<Result<bool>> completeOnboarding();
  Result<bool> getOnboardingStatus();
}
