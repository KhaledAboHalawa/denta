import 'package:denta/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/register/presentation/screens/register_screen.dart';
import '../../features/auth/role_selection/presentation/screens/role_selection_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.roleSelectionPath,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.registerPath,
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterScreen();
      },
     
    ),
    GoRoute(
      path: RoutePaths.roleSelectionPath,
      builder: (BuildContext context, GoRouterState state) {
        return const RoleSelectionScreen();
      },
     
    ),
  ],
);
