import 'package:denta/core/config/base_response/result.dart';
import 'package:denta/core/errors/errors_handler.dart';
import 'package:denta/core/utils/app_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class OnboardingDataSource {
  OnboardingDataSource({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<Result<bool>> completeOnboarding() async {
    try {
      await sharedPreferences.setBool(AppKeys.onboardingCompletedKey, true);
      return Result.success(true);
    } catch (e) {
      return Result.error(ErrorHandler.handle(e).failure);
    }
  }

  Result<bool> getOnboardingStatus() {
    try {
      return Result.success(
        sharedPreferences.getBool(AppKeys.onboardingCompletedKey) ?? false,
      );
    } catch (e) {
      return Result.error(ErrorHandler.handle(e).failure);
    }
  }
}
