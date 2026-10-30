import 'package:denta/features/forgot_password/presentation/screens/forget_password_screen.dart';
import 'package:denta/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:denta/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/onboarding/domain/use_case/get_onboarding_status_use_case.dart';
import '../../features/questionnaire/presentation/screens/questionnaire_screen.dart';
import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/sign_in/presentation/screens/sign_in_screen.dart';
import '../../features/user_role_selection/presentation/screens/role_selection_screen.dart';
import '../../features/user_role_selection/presentation/widgets/role_selection_section.dart';
import '../di/dependency_injection.dart';
import 'route_paths.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.onboardingPath,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.onboardingPath,
      name: RoutePaths.onboardingPath,
      redirect: (context, state) {
        final onboardingCompleted = getIt<GetOnboardingStatusUseCase>().call();
        return onboardingCompleted.when(
          success: (data) {
            return null;
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
      path: RoutePaths.roleSelectionPath,
      name: RoutePaths.roleSelectionPath,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          CupertinoPage(child: const RoleSelectionScreen()),
      routes: [
        GoRoute(
          path: RoutePaths.registerPath,
          name: RoutePaths.registerPath,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(
                key: state.pageKey,
                child: RegisterScreen(role: state.extra as UserRole),
              ),
        ),
        GoRoute(
          path: RoutePaths.signInPath,
          name: RoutePaths.signInPath,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CupertinoPage(child: const SignInScreen()),
        ),
      ],
    ),
    GoRoute(
      path: RoutePaths.forgetPasswordPath,
      name: RoutePaths.forgetPasswordPath,
      pageBuilder: (context, state) => CupertinoPage(
        key: state.pageKey,
        child: const ForgetPasswordScreen(),
      ),
    ),
    GoRoute(
      path: RoutePaths.questionnairePath,
      name: RoutePaths.questionnairePath,
      pageBuilder: (context, state) =>
          CupertinoPage(key: state.pageKey, child: const QuestionnaireScreen()),
    ),
    GoRoute(
      path: RoutePaths.notificationsPath,
      name: RoutePaths.notificationsPath,
      pageBuilder: (context, state) =>
          CupertinoPage(child: const NotificationsScreen()),
    ),
  ],
);
