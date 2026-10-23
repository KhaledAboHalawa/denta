import 'package:denta/features/forgot_password/presentation/screens/forget_password_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/otp_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/reset_password_screen.dart';
import 'package:denta/features/forgot_password/presentation/screens/reset_password_success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/register/presentation/screens/register_screen.dart';
import '../../features/sign_in/presentation/screens/sign_in_screen.dart';
import '../../features/user_role_selection/presentation/screens/role_selection_screen.dart';
import '../../features/user_role_selection/presentation/widgets/role_selection_section.dart';
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
  initialLocation: RoutePaths.roleSelectionPath,
  routes: <RouteBase>[
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
  ],
);
