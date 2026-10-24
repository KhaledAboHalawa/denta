import 'package:denta/features/forgot_password/presentation/screens/forget_password_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/otp_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/reset_password_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/reset_password_success_screen.dart';
import 'package:denta/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:denta/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/domain/use_case/get_onboarding_status_use_case.dart';
import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/sign_in/presentation/screens/sign_in_screen.dart';
import '../../features/user_role_selection/presentation/screens/role_selection_screen.dart';
import '../../features/user_role_selection/presentation/widgets/role_selection_section.dart';
import '../di/dependency_injection.dart';
import 'route_paths.dart';

enum SlideDirection {
  fromTrailing,
  fromLeading,
  fromRight,
  fromLeft,
  fromBottom,
  fromTop,
}

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.notificationsPath,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.onboardingPath,
      redirect: (context, state) {
        final onboardingCompleted = getIt<GetOnboardingStatusUseCase>().call();
        return onboardingCompleted.when(
          success: (data) {
            if (data) {
              return RoutePaths.roleSelectionPath;
            }
            return null;
          },
          error: (error) {
            return null;
          },
        );
      },
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CupertinoPage(key: state.pageKey, child: const OnboardingScreen()),
    ),
    GoRoute(
      path: RoutePaths.registerPath,
      pageBuilder: (BuildContext context, GoRouterState state) => CupertinoPage(
        key: state.pageKey,
        child: RegisterScreen(role: state.extra as UserRole),
      ),
    ),
    GoRoute(
      path: RoutePaths.roleSelectionPath,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CupertinoPage(child: const RoleSelectionScreen()),
    ),
    GoRoute(
      path: RoutePaths.signInPath,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CupertinoPage(child: const SignInScreen()),
    ),
    GoRoute(
      path: RoutePaths.forgetPasswordPath,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const ForgetPasswordScreen(),
      ),
    ),
    GoRoute(
      path: RoutePaths.otpPath,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: OtpScreen(email: state.extra as String? ?? ''),
      ),
    ),
    GoRoute(
      path: RoutePaths.resetPasswordPath,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const ResetPasswordScreen()),
    ),
    GoRoute(
      path: RoutePaths.resetPasswordSuccessPath,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const ResetPasswordSuccessScreen(),
      ),
    ),
    GoRoute(
      path: RoutePaths.notificationsPath,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const NotificationsScreen(),
      ),
    ),
  ],
);
