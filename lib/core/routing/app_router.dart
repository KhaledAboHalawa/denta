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
      builder: (BuildContext context, GoRouterState state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: RoutePaths.signInPath,
      builder: (BuildContext context, GoRouterState state) => const SignInScreen(),
    ),
  ],
);
